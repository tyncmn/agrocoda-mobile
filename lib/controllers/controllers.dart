import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginController =
    StateNotifierProvider<LoginController, AsyncValue<LoginResponse>>((ref) {
  final repository = ref.watch(repositoryProvider);
  return LoginController(repository);
});

class LoginController extends StateNotifier<AsyncValue<LoginResponse>> {
  final Repository _repository;

  LoginController(this._repository) : super(const AsyncValue.loading());

  Future<void> login(LoginRequest request) async {
    try {
      state = const AsyncValue.loading();
      final response = await _repository.login(request);
      state = AsyncValue.data(response);
    } catch (e, stk) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, stk);
    }
  }
}
