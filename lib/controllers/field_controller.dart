import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fieldController = StateNotifierProvider<FieldController, AsyncValue<FieldModel>>(
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