import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/assets_const.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';

import '../widgets/home_button.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: const AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetConst.menuButton),
                Text(
                  'Hello Murad!',
                  style: context.largerTextStyle,
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeButton(
                  asset: AssetConst.humidityButton,
                  title: '2.41',
                  subtitle: 'HUMIDITY',
                ),
                HomeButton(
                  asset: AssetConst.phButton,
                  title: '68m²',
                  subtitle: 'PH LEVEL',
                ),
                HomeButton(
                  asset: AssetConst.humidityButton,
                  title: '73%',
                  subtitle: 'TEMPRATURE',
                ),
              ],
            ),
            const SizedBox(height: 50),
            const HumidityCard(),
            const SizedBox(height: 25),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: context.primaryColor),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/components/plant.svg'),
                          const SizedBox(width: 10),
                          Text(
                            'CO2',
                            style: context.largeTextStyle.copyWith(
                              color: context.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '412 ppm',
                        style: context.largerTextStyle?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Flexible(
                        // Set a fixed height for the chart
                        child: LineChart(
                          LineChartData(
                            gridData: const FlGridData(
                                show: false), // Turn off grid lines
                            titlesData: const FlTitlesData(
                                show: false), // Turn off axis titles
                            borderData:
                                FlBorderData(show: false), // Turn off border
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  const FlSpot(0, 1),
                                  const FlSpot(1, 3),
                                  const FlSpot(2, 10),
                                  const FlSpot(3, 7),
                                  const FlSpot(4, 9),
                                  const FlSpot(5, 6),
                                  const FlSpot(6, 3),
                                  const FlSpot(7, 4),
                                ],
                                barWidth: 5,
                                isStrokeCapRound: true,
                                dotData: const FlDotData(
                                  show: false,
                                ), // Hide the dot data points
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      context.primaryColor.withOpacity(0.2),
                                      context.primaryColor.withOpacity(0.01),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class HumidityCard extends StatelessWidget {
  const HumidityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 17,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(child: SvgPicture.asset(AssetConst.flowerButton)),
              const SizedBox(width: 10),
              Text(
                'Humidity of the soil',
                style: context.largeTextStyle.copyWith(
                  color: context.primaryColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            '15%',
            style: context.largerTextStyle,
          ),
          SliderTheme(
            data: SliderThemeData(
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              value: 0.8,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'See more',
                style: context.largeTextStyle.copyWith(
                  color: const Color(0xFF5E5E5E),
                  fontSize: 16,
                ),
              ),
              SvgPicture.asset(AssetConst.nextButton),
            ],
          ),
        ],
      ),
    );
  }
}
