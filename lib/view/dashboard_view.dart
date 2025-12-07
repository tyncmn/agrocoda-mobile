import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/controllers/dashboard_controller.dart';
import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/utils/assets_const.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initial data fetch
      ref.read(sensorDataController.notifier).getSensorData();

      // Start auto-refresh every 3 seconds for real-time data
      _startAutoRefresh();
    });
  }

  void _startAutoRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      ref.read(sensorDataController.notifier).refreshSensorData();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _loadAIAnalysis() {
    ref.read(dashboardDataController.notifier).getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    final sensorData = ref.watch(sensorDataController);
    final dashboardData = ref.watch(dashboardDataController);

    return Scaffold(
      body: SafeArea(
        child: sensorData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(sensorDataController.notifier).getSensorData();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (sensors) {
            if (sensors.isEmpty) {
              return const Center(child: Text('No sensor data available'));
            }

            final sensor = sensors.first;

            return RefreshIndicator(
              onRefresh: () async {
                await ref.read(sensorDataController.notifier).getSensorData();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                children: [
                  const SizedBox(height: 16),
                  _buildHeader(context),
                  const SizedBox(height: 30),
                  _buildQuickStats(context, sensor),
                  const SizedBox(height: 30),
                  _buildSensorGrid(context, sensor),
                  const SizedBox(height: 30),
                  _buildAIAnalysisSection(context, dashboardData),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AssetConst.menuButton),
        Column(
          children: [
            Text(
              'Agrocoda Dashboard',
              style: context.largerTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Real-time Monitoring',
              style: context.smallTextStyle.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.primaryColor.withOpacity(0.2),
          ),
          child:
              Icon(Icons.notifications_outlined, color: context.primaryColor),
        ),
      ],
    );
  }

  Widget _buildQuickStats(BuildContext context, SensorData sensor) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.thermostat_outlined,
            title: 'Temperature',
            value: '${sensor.temperature.toStringAsFixed(1)}°C',
            color: Colors.orange,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.water_drop_outlined,
            title: 'Humidity',
            value: '${sensor.humidity.toStringAsFixed(1)}%',
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.opacity_outlined,
            title: 'Moisture',
            value: '${(sensor.moisture * 100).toStringAsFixed(1)}%',
            color: Colors.teal,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor.withOpacity(0.3)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: context.largeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: context.smallTextStyle.copyWith(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSensorGrid(BuildContext context, SensorData sensor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sensor Readings',
          style: context.largeTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: [
            _buildSensorTile(
              context,
              'pH Level',
              sensor.ph.toStringAsFixed(2),
              Icons.science_outlined,
              _getPhColor(sensor.ph),
            ),
            _buildSensorTile(
              context,
              'Nitrogen',
              '${sensor.nitrogen.toStringAsFixed(0)} ppm',
              Icons.bubble_chart_outlined,
              Colors.green,
            ),
            _buildSensorTile(
              context,
              'Phosphorus',
              '${sensor.phosphorus.toStringAsFixed(1)} ppm',
              Icons.grain_outlined,
              Colors.purple,
            ),
            _buildSensorTile(
              context,
              'Potassium',
              '${sensor.potassium.toStringAsFixed(1)} ppm',
              Icons.eco_outlined,
              Colors.amber,
            ),
            _buildSensorTile(
              context,
              'Gas',
              '${sensor.gas.toStringAsFixed(1)} ppm',
              Icons.air_outlined,
              Colors.red,
            ),
            _buildSensorTile(
              context,
              'Pressure',
              '${sensor.pressure.toStringAsFixed(1)} hPa',
              Icons.compress_outlined,
              Colors.indigo,
            ),
            _buildSensorTile(
              context,
              'Oxygen',
              '${sensor.oxygen.toStringAsFixed(1)}%',
              Icons.wind_power_outlined,
              Colors.cyan,
            ),
            _buildSensorTile(
              context,
              'Methane',
              '${sensor.metan.toStringAsFixed(2)} ppm',
              Icons.warning_amber_outlined,
              Colors.deepOrange,
            ),
            _buildSensorTile(
              context,
              'Ammonium',
              '${sensor.ammonium.toStringAsFixed(1)} ppb',
              Icons.water_outlined,
              Colors.lightBlue,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSensorTile(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor.withOpacity(0.3)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: context.smallTextStyle.copyWith(
                    fontSize: 13,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: context.largeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIAnalysisSection(
    BuildContext context,
    AsyncValue<DashboardData?> dashboardData,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'AI Analysis',
              style: context.largeTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            ElevatedButton.icon(
              onPressed: _loadAIAnalysis,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Load Analysis'),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        dashboardData.when(
          loading: () => Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.primaryColor.withOpacity(0.3)),
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                'Failed to load AI analysis',
                style: context.smallTextStyle.copyWith(color: Colors.red),
              ),
            ),
          ),
          data: (data) {
            if (data == null) {
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: context.primaryColor.withOpacity(0.3)),
                ),
                child: Center(
                  child: Text(
                    'Click "Load Analysis" to get AI insights',
                    style: context.smallTextStyle.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return _buildAIInsights(context, data);
          },
        ),
      ],
    );
  }

  Widget _buildAIInsights(BuildContext context, DashboardData data) {
    final insight = data.agroInsight;

    return Column(
      children: [
        // Overall Status Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getStatusColor(insight.overallStatus).withOpacity(0.1),
            border: Border.all(
              color: _getStatusColor(insight.overallStatus),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getStatusIcon(insight.overallStatus),
                    color: _getStatusColor(insight.overallStatus),
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status: ${insight.overallStatus.toUpperCase()}',
                          style: context.largeTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: _getStatusColor(insight.overallStatus),
                          ),
                        ),
                        Text(
                          'Confidence: ${(insight.confidenceLevel * 100).toStringAsFixed(0)}%',
                          style: context.smallTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                insight.riskSummary,
                style: context.smallTextStyle.copyWith(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Nutrient Balance
        _buildNutrientBalance(context, insight.nutrientBalance),
        const SizedBox(height: 16),

        // Environmental Status
        _buildEnvironmentalStatus(context, insight),
        const SizedBox(height: 16),

        // Recommendations
        _buildRecommendations(context, insight.recommendedActionsFarmer),
      ],
    );
  }

  Widget _buildNutrientBalance(BuildContext context, NutrientBalance balance) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrient Balance',
            style: context.largeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _buildNutrientRow('Nitrogen', balance.nitrogen),
          _buildNutrientRow('Phosphorus', balance.phosphorus),
          _buildNutrientRow('Potassium', balance.potassium),
          _buildNutrientRow('pH Level', balance.phLevel),
        ],
      ),
    );
  }

  Widget _buildNutrientRow(String label, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _getNutrientColor(status).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _getNutrientColor(status),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnvironmentalStatus(BuildContext context, AgroInsight insight) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Environmental Status',
            style: context.largeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _buildStatusRow(Icons.water_drop, 'Moisture', insight.moistureStatus),
          _buildStatusRow(Icons.warning_amber, 'Gas Risk', insight.gasRisk),
          _buildStatusRow(Icons.public, 'Seismic Risk', insight.seismicRisk),
        ],
      ),
    );
  }

  Widget _buildStatusRow(IconData icon, String label, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _getNutrientColor(status).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _getNutrientColor(status),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendations(
      BuildContext context, List<String> recommendations) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Actions',
            style: context.largeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          ...recommendations.take(5).map((rec) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: context.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        rec,
                        style: context.smallTextStyle.copyWith(
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          if (recommendations.length > 5)
            TextButton(
              onPressed: () {
                _showAllRecommendations(context, recommendations);
              },
              child: Text(
                'View all ${recommendations.length} recommendations',
                style: TextStyle(color: context.primaryColor),
              ),
            ),
        ],
      ),
    );
  }

  void _showAllRecommendations(
      BuildContext context, List<String> recommendations) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'All Recommended Actions',
                style: context.largeTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: recommendations.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: context.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            recommendations[index],
                            style: context.smallTextStyle.copyWith(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getPhColor(double ph) {
    if (ph < 6.0) return Colors.orange;
    if (ph > 7.5) return Colors.blue;
    return Colors.green;
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'good':
      case 'normal':
        return Colors.green;
      case 'warning':
      case 'moderate':
        return Colors.orange;
      case 'risk':
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'good':
      case 'normal':
        return Icons.check_circle;
      case 'warning':
      case 'moderate':
        return Icons.warning;
      case 'risk':
      case 'high':
        return Icons.error;
      default:
        return Icons.info;
    }
  }

  Color _getNutrientColor(String status) {
    switch (status.toLowerCase()) {
      case 'normal':
      case 'good':
      case 'none':
        return Colors.green;
      case 'high':
      case 'acidic':
      case 'alkaline':
        return Colors.orange;
      case 'low':
      case 'dry':
      case 'moderate':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}
