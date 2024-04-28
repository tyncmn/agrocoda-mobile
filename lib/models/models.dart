class LoginResponse {
  final int user;
  final List<LoginField> fields;

  const LoginResponse({
    required this.user,
    required this.fields,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: json['user_id'],
      fields:
          (json['fields'] as List).map((e) => LoginField.fromJson(e)).toList(),
    );
  }
}

class LoginField {
  final int device;
  final int field;

  const LoginField({
    required this.device,
    required this.field,
  });

  factory LoginField.fromJson(Map<String, dynamic> json) {
    return LoginField(
      device: json['arduino_id'],
      field: json['field_id'],
    );
  }
}

class FieldModel {
  final int? id;
  final List<Recommend?> recommend;
  const FieldModel({
    this.id,
    required this.recommend,
  });
  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      recommend: (json['recommend'] as List)
          .map((e) => Recommend.fromJson(e))
          .toList(),
    );
  }
}

class Recommend {
  final name;

  const Recommend({
    this.name,
  });

  factory Recommend.fromJson(Map<String, dynamic> json) {
    return Recommend(
      name: json['name'],
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
  final int ardunioId;
  final double? temprature;
  final double? humidity;
  final double? gas;
  final double? moisture;
  final double? nitrogen;
  final double? phosphorus;
  final double? potassium;
  final double? ph;
  final double? pressure;
  final double? ammonium;
  final double? oxygen;
  final double? metan;

  const Data({
    required this.ardunioId,
    this.temprature,
    this.humidity,
    this.gas,
    this.moisture,
    this.nitrogen,
    this.phosphorus,
    this.potassium,
    this.ph,
    this.pressure,
    this.ammonium,
    this.oxygen,
    this.metan,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      ardunioId: json['arduino_id'],
      temprature: json['temperature'],
      humidity: json['humidity'],
      gas: json['gas'],
      moisture: json['moisture'],
      nitrogen: json['nitrogen'],
      phosphorus: json['phosphorus'],
      potassium: json['potassium'],
      ph: json['ph'],
      pressure: json['pressure'],
      ammonium: json['ammonium'],
      oxygen: json['oxygen'],
      metan: json['metan'],
    );
  }
}
