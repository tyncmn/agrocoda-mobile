import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataController =
    StateNotifierProvider<DataController, AsyncValue<List<Data>>>((ref) {
  final repository = ref.watch(repositoryProvider);
  return DataController(repository);
});

class DataController extends StateNotifier<AsyncValue<List<Data>>> {
  final Repository _repository;

  DataController(this._repository) : super(const AsyncValue.loading());

  Future<void> getField(int id) async {
    try {
      state = const AsyncValue.loading();
      final data = await _repository.getField(id);
      state = AsyncValue.data(data);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }

  Future<void> getNewDatas(int id) async {
    try {
      final data = await _repository.getField(id);
      state = AsyncValue.data(data);
    } catch (e) {
      rethrow;
    }
  }
}
