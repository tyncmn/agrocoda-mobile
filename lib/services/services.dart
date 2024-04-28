import 'dart:core';

import 'package:cookers_app/interceptor.dart';
import 'package:cookers_app/models/models.dart';
import 'package:cookers_app/models/request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'services.g.dart';

final servicesProvider = Provider((ref) {
  final dio = Dio();
  dio.interceptors.add(
    LoggerInterceptor(),
  );
  return Services(dio);
});

@RestApi(baseUrl: 'http://207.154.216.121:5533/')
abstract class Services {
  factory Services(Dio dio) {
    dio.options.headers['Content-Type'] = 'application/json';
    return _Services(dio);
  }
  @POST('login')
  Future<LoginResponse> login(
    @Body() LoginRequest request,
  );

  @POST('field')
  Future<FieldModel> addField(@Body() FieldRequest request);

  @POST('field/{id}')
  Future<void> addField2(
    @Path() int id,
    @Body() SensorRequest body,
  );

  @GET('fields')
  Future<GetFields> getFields(
    @Field() int userId,
  );

  @GET('data/{id}/all')
  Future<List<Data>> getField(@Path() int id);
}
