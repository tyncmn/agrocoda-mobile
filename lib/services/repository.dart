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

  Future<FieldModel> addField(FieldRequest request) async {
    try {
      final response = await _services.addField(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addField2(SensorRequest body) async {
    try {
      await _services.addField2(body.fieldId, body);
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

  Future<List<Data>> getField(int id) async {
    try {
      return await _services.getField(id);
    } catch (e) {
      rethrow;
    }
  }

  // Dashboard methods
  Future<List<SensorData>> getSensorDataBare() async {
    try {
      return await _services.getSensorDataBare();
    } catch (e) {
      rethrow;
    }
  }

  Future<DashboardData> getDashboardData() async {
    try {
      return await _services.getDashboardData();
    } catch (e) {
      rethrow;
    }
  }
}
