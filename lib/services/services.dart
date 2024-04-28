import 'dart:core';

import 'package:cookers_app/models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'services.g.dart';

@RestApi(baseUrl: 'http://207.154.216.121:5955/')
abstract class Services {
  factory Services(Dio dio) {
    return _Services(dio);
  }
  @POST('login')
  Future<HttpResponse<int>> login(@Body() Map<String, dynamic> body);
  @POST('field')
  Future<HttpResponse<FieldModel>> addField(@Body() Map<String, dynamic> body);
  @POST('field/{id}')
  Future<void> addField2(
    @Path() int id,
    @Body() Map<String, dynamic> body,
  );
  @GET('fields')
  Future<HttpResponse<GetFields>> getFields(
    @Body() Map<String, dynamic> body,
  );
  @GET('data/{id}/all')
  Future<HttpResponse<List<Data>>> getField(
    @Path() int id,
    @Body() Map<String, dynamic> body,
  );
}
