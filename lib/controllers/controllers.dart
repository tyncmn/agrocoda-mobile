import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginController =
    StateNotifierProvider<LoginController, AsyncValue>((ref) {
  final repository = ref.watch(repositoryProvider);
  return LoginController(repository);
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  final Repository _repository;

  LoginController(this._repository) : super(const AsyncValue.loading());

  Future<void> login(LoginRequest request) async {
    try {
      state = const AsyncValue.loading();
      await _repository.login(request);
      state = const AsyncValue.data(null);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }
}
