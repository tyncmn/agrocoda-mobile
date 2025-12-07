import 'dart:developer';

import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for real-time sensor data
final sensorDataController =
    StateNotifierProvider<SensorDataController, AsyncValue<List<SensorData>>>(
        (ref) {
  final repository = ref.watch(repositoryProvider);
  return SensorDataController(repository);
});

// Provider for full dashboard data with AI insights
final dashboardDataController =
    StateNotifierProvider<DashboardDataController, AsyncValue<DashboardData?>>(
        (ref) {
  final repository = ref.watch(repositoryProvider);
  return DashboardDataController(repository);
});

class SensorDataController extends StateNotifier<AsyncValue<List<SensorData>>> {
  final Repository _repository;

  SensorDataController(this._repository) : super(const AsyncValue.loading());

  Future<void> getSensorData() async {
    try {
      state = const AsyncValue.loading();
      final data = await _repository.getSensorDataBare();
      state = AsyncValue.data(data);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }

  // Refresh without loading state for smooth updates
  Future<void> refreshSensorData() async {
    try {
      final data = await _repository.getSensorDataBare();
      state = AsyncValue.data(data);
    } catch (e) {
      // Keep previous state on error during refresh
    }
  }
}

class DashboardDataController
    extends StateNotifier<AsyncValue<DashboardData?>> {
  final Repository _repository;

  DashboardDataController(this._repository)
      : super(const AsyncValue.data(null));

  Future<void> getDashboardData() async {
    try {
      state = const AsyncValue.loading();
      final data = await _repository.getDashboardData();
      state = AsyncValue.data(data);
    } catch (e, stk) {
      log('Error fetching dashboard data: $e', stackTrace: stk);
      state = AsyncValue.error(e, stk);
    }
  }

  // Refresh without loading state
  Future<void> refreshDashboardData() async {
    try {
      final data = await _repository.getDashboardData();
      state = AsyncValue.data(data);
    } catch (e) {
      // Keep previous state on error during refresh
    }
  }
}
