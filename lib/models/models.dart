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
  final List<String> recommend;
  const FieldModel({
    this.id,
    required this.recommend,
  });
  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      recommend: (json['recommend'] as List<dynamic>)
          .map(
            (e) => e.toString(),
          )
          .toList(),
    );
  }
}

class Recommend {
  final String name;

  const Recommend({
    required this.name,
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

// Dashboard Models
class SensorData {
  final int arduinoId;
  final double temperature;
  final double humidity;
  final double gas;
  final double moisture;
  final double nitrogen;
  final double phosphorus;
  final double potassium;
  final double ph;
  final double pressure;
  final double ammonium;
  final double oxygen;
  final double metan;

  const SensorData({
    required this.arduinoId,
    required this.temperature,
    required this.humidity,
    required this.gas,
    required this.moisture,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.ph,
    required this.pressure,
    required this.ammonium,
    required this.oxygen,
    required this.metan,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      arduinoId: json['arduino_id'] ?? 0,
      temperature: (json['temperature'] ?? 0).toDouble(),
      humidity: (json['humidity'] ?? 0).toDouble(),
      gas: (json['gas'] ?? 0).toDouble(),
      moisture: (json['moisture'] ?? 0).toDouble(),
      nitrogen: (json['nitrogen'] ?? 0).toDouble(),
      phosphorus: (json['phosphorus'] ?? 0).toDouble(),
      potassium: (json['potassium'] ?? 0).toDouble(),
      ph: (json['ph'] ?? 0).toDouble(),
      pressure: (json['pressure'] ?? 0).toDouble(),
      ammonium: (json['ammonium'] ?? 0).toDouble(),
      oxygen: (json['oxygen'] ?? 0).toDouble(),
      metan: (json['metan'] ?? 0).toDouble(),
    );
  }
}

class SatelliteIndices {
  final Map<String, double> ndvi;
  final Map<String, double> moistureIndex;
  final Map<String, double> ndwi;

  const SatelliteIndices({
    required this.ndvi,
    required this.moistureIndex,
    required this.ndwi,
  });

  factory SatelliteIndices.fromJson(Map<String, dynamic> json) {
    return SatelliteIndices(
      ndvi: Map<String, double>.from(json['NDVI'] ?? {}),
      moistureIndex: Map<String, double>.from(json['MOISTURE-INDEX1-L1'] ?? {}),
      ndwi: Map<String, double>.from(json['NDWI-L1C'] ?? {}),
    );
  }
}

class SatelliteData {
  final double lat;
  final double lon;
  final String bbox;
  final String dateFrom;
  final String dateTo;
  final SatelliteIndices indices;
  final String soilPrediction;
  final String notes;

  const SatelliteData({
    required this.lat,
    required this.lon,
    required this.bbox,
    required this.dateFrom,
    required this.dateTo,
    required this.indices,
    required this.soilPrediction,
    required this.notes,
  });

  factory SatelliteData.fromJson(Map<String, dynamic> json) {
    return SatelliteData(
      lat: (json['lat'] ?? 0).toDouble(),
      lon: (json['lon'] ?? 0).toDouble(),
      bbox: json['bbox'] ?? '',
      dateFrom: json['date_from'] ?? '',
      dateTo: json['date_to'] ?? '',
      indices: SatelliteIndices.fromJson(json['indices'] ?? {}),
      soilPrediction: json['soil_prediction'] ?? '',
      notes: json['notes'] ?? '',
    );
  }
}

class NutrientBalance {
  final String nitrogen;
  final String phosphorus;
  final String potassium;
  final String phLevel;

  const NutrientBalance({
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.phLevel,
  });

  factory NutrientBalance.fromJson(Map<String, dynamic> json) {
    return NutrientBalance(
      nitrogen: json['nitrogen'] ?? '',
      phosphorus: json['phosphorus'] ?? '',
      potassium: json['potassium'] ?? '',
      phLevel: json['ph_level'] ?? '',
    );
  }
}

class AgroInsight {
  final String overallStatus;
  final String riskSummary;
  final List<String> keyFindings;
  final NutrientBalance nutrientBalance;
  final String moistureStatus;
  final String gasRisk;
  final String seismicRisk;
  final List<String> recommendedActionsFarmer;
  final List<String> recommendedActionsGovernment;
  final double confidenceLevel;
  final List<String> dataWarnings;

  const AgroInsight({
    required this.overallStatus,
    required this.riskSummary,
    required this.keyFindings,
    required this.nutrientBalance,
    required this.moistureStatus,
    required this.gasRisk,
    required this.seismicRisk,
    required this.recommendedActionsFarmer,
    required this.recommendedActionsGovernment,
    required this.confidenceLevel,
    required this.dataWarnings,
  });

  factory AgroInsight.fromJson(Map<String, dynamic> json) {
    return AgroInsight(
      overallStatus: json['overall_status'] ?? '',
      riskSummary: json['risk_summary'] ?? '',
      keyFindings: List<String>.from(json['key_findings'] ?? []),
      nutrientBalance: NutrientBalance.fromJson(json['nutrient_balance'] ?? {}),
      moistureStatus: json['moisture_status'] ?? '',
      gasRisk: json['gas_risk'] ?? '',
      seismicRisk: json['seismic_risk'] ?? '',
      recommendedActionsFarmer:
          List<String>.from(json['recommended_actions_farmer'] ?? []),
      recommendedActionsGovernment:
          List<String>.from(json['recommended_actions_government'] ?? []),
      confidenceLevel: (json['confidence_level'] ?? 0).toDouble(),
      dataWarnings: List<String>.from(json['data_warnings'] ?? []),
    );
  }
}

class DashboardData {
  final SatelliteData satelliteData;
  final List<SensorData> controllerData;
  final AgroInsight agroInsight;

  const DashboardData({
    required this.satelliteData,
    required this.controllerData,
    required this.agroInsight,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      satelliteData: SatelliteData.fromJson(json['satellite_data'] ?? {}),
      controllerData: (json['controller_data'] as List?)
              ?.map((e) => SensorData.fromJson(e))
              .toList() ??
          [],
      agroInsight: AgroInsight.fromJson(json['agro_insight'] ?? {}),
    );
  }
}
