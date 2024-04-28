class LoginResponse {
  final int user;
  final List<FieldModel> fields;

  const LoginResponse({
    required this.user,
    required this.fields,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: json['user_id'],
      fields:
          (json['fields'] as List).map((e) => FieldModel.fromJson(e)).toList(),
    );
  }
}

class FieldModel {
  final int? id;
  final List<String>? recommend;
  const FieldModel({
    this.id,
    this.recommend,
  });
  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      recommend: (json['recommend'] as List<String>),
    );
  }
}

class GetFields {
  final List<int>? data;
  const GetFields({
    this.data,
  });
  factory GetFields.fromJson(Map<String, dynamic> json) {
    return GetFields(
      data: json['fields'],
    );
  }
}

class Data {
  final double? temperature,
      humidity,
      moisture,
      nitrogen,
      gas,
      phosphorus,
      potassium;
  const Data({
    this.temperature,
    this.humidity,
    this.moisture,
    this.nitrogen,
    this.gas,
    this.phosphorus,
    this.potassium,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      gas: json['gas'],
      humidity: json['humidity'],
      moisture: json['moisture'],
      nitrogen: json['nitrogen'],
      phosphorus: json['phosphorus'],
      potassium: json['potassium'],
      temperature: json['temperature'],
    );
  }
}
