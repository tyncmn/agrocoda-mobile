import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fieldController =
    StateNotifierProvider<FieldController, AsyncValue<FieldModel>>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return FieldController(repository);
  },
);

class FieldController extends StateNotifier<AsyncValue<FieldModel>> {
  final Repository _repository;
  FieldController(this._repository) : super(const AsyncValue.loading());

  Future<void> addField(FieldRequest request) async {
    try {
      state = const AsyncValue.loading();
      final data = await _repository.addField(request);
      state = AsyncValue.data(data);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }
}

final sensorController =
    StateNotifierProvider<SensorController, AsyncValue<void>>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return SensorController(repository);
  },
);

class SensorController extends StateNotifier<AsyncValue<void>> {
  final Repository _repository;
  SensorController(this._repository) : super(const AsyncValue.loading());

  Future<void> addField2(SensorRequest request) async {
    try {
      state = const AsyncValue.loading();
      await _repository.addField2(request);
      state = const AsyncValue.data(null);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }
}
