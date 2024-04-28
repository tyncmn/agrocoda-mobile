import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) {
  final services = ref.watch(servicesProvider);
  return Repository(services);
});

class Repository {
  final Services _services;

  Repository(this._services);

  Future<LoginResponse> login(int id, String password) async {
    try {
      return await _services.login(id, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addField(Map<String, dynamic> body) async {
    try {
      await _services.addField(body);
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

  Future<GetFields> getFields(Map<String, dynamic> body) async {
    try {
      return await _services.getFields(body);
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
