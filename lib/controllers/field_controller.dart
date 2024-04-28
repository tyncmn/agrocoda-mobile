import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fieldController = StateNotifierProvider<FieldController, AsyncValue<void>>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return FieldController(repository);
  },
);

class FieldController extends StateNotifier<AsyncValue<void>> {
  final Repository _repository;
  FieldController(this._repository) : super(const AsyncValue.loading());

  Future<void> addField(FieldRequest request) async {
    try {
      state = const AsyncValue.loading();
      await _repository.addField(request);
      state = const AsyncValue.data(null);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }
}