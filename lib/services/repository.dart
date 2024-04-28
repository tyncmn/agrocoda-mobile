import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) {
  final services = ref.watch(servicesProvider);
  return Repository(services);
});

class Repository {
  final Services _services;

  Repository(this._services);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      return await _services.login(request);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addField(FieldRequest request) async {
    try {
      await _services.addField(request);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addField2(int id, Map<String, dynamic> body) async {
    try {
      await _services.addField2(id, body);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetFields> getFields(int userId) async {
    try {
      return await _services.getFields(userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Data>> getField(int id, Map<String, dynamic> body) async {
    try {
      return await _services.getField(id, body);
    } catch (e) {
      rethrow;
    }
  }
}
