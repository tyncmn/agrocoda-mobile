// ignore_for_file: non_constant_identifier_names

class LoginRequest {
  final int id;
  final String password;

  LoginRequest({
    required this.id,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': id,
      'password': password,
    };
  }
}

class SensorRequest {
  final int fieldId;
  final int userId;
  final String date;
  final String crop;

  SensorRequest({
    required this.fieldId,
    required this.userId,
    required this.date,
    required this.crop,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'plant_date': date,
      'crop': crop,
    };
  }
}

class FieldRequest {
  final int area;
  final String loc;
  final int arduino;

  FieldRequest({
    required this.area,
    required this.loc,
    required this.arduino,
  });

  Map<String, dynamic> toJson() {
    return {
      'area': area,
      'loc': loc,
      'arduino_id': arduino,
    };
  }
}

class CropRequest {
  final String crop;
  final String plantDate;

  CropRequest({
    required this.crop,
    required this.plantDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'crop': crop,
      'plant_date': plantDate,
    };
  }
}
