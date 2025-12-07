# Dashboard Feature

## Overview

The dashboard provides real-time monitoring of Arduino sensor data with AI-powered agricultural insights for the Agrocoda project.

## Features

### 1. Real-time Sensor Monitoring

- Automatic data refresh every 3 seconds without loading effects
- Displays data from: `http://10.20.2.18:8000/items/bare`
- Monitors:
  - Temperature (°C)
  - Humidity (%)
  - Soil Moisture (%)
  - pH Level
  - Nitrogen (ppm)
  - Phosphorus (ppm)
  - Potassium (ppm)
  - Gas levels (ppm)
  - Atmospheric Pressure (hPa)
  - Oxygen (%)
  - Methane (ppm)
  - Ammonium (ppb)

### 2. AI Analysis (On-Demand)

- Click "Load Analysis" button to fetch comprehensive agricultural insights
- Data from: `http://10.20.2.18:8000/items/recent`
- Includes:
  - Overall field status (Risk/Warning/Good)
  - Risk summary with confidence level
  - Nutrient balance (N, P, K, pH)
  - Environmental status (moisture, gas risk, seismic risk)
  - Satellite data insights (NDVI, NDWI, Moisture Index)
  - Actionable recommendations for farmers
  - Data warnings and notes

## Navigation

To navigate to the dashboard from anywhere in the app:

```dart
context.router.push(const DashboardRoute());
```

Or using the router directly:

```dart
AutoRouter.of(context).push(const DashboardRoute());
```

## Architecture

### Models

- `SensorData` - Real-time sensor readings
- `DashboardData` - Complete analysis data
- `SatelliteData` - Satellite imagery indices
- `AgroInsight` - AI-generated agricultural insights
- `NutrientBalance` - Nutrient level analysis

### Controllers

- `SensorDataController` - Manages real-time sensor data with auto-refresh
- `DashboardDataController` - Manages AI analysis data (manual refresh)

### API Endpoints

```dart
@GET('items/bare')
Future<List<SensorData>> getSensorDataBare();

@GET('items/recent')
Future<DashboardData> getDashboardData();
```

## Usage Example

### Access Dashboard

```dart
import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/router/auto_router.dart';

// In your widget
ElevatedButton(
  onPressed: () {
    context.router.push(const DashboardRoute());
  },
  child: const Text('Open Dashboard'),
)
```

### Manual Data Refresh

The real-time sensor data refreshes automatically every 3 seconds. Pull down to manually refresh:

- Pull-to-refresh gesture supported
- AI Analysis requires manual button click to load

## Design Consistency

The dashboard follows the Agrocoda design system:

- Primary color: `#29B674` (green)
- Rounded corners: 16px
- Border style: 1px solid with opacity
- Font family: Tommy
- Responsive grid layout
- Color-coded status indicators

## Status Color Coding

### Overall Status

- 🟢 Green: Good/Normal
- 🟠 Orange: Warning/Moderate
- 🔴 Red: Risk/High

### Nutrient Levels

- 🟢 Green: Normal/Good
- 🟠 Orange: High/Acidic/Alkaline
- 🟡 Amber: Low/Dry/Moderate

### pH Levels

- 🟠 Orange: < 6.0 (Too acidic)
- 🟢 Green: 6.0 - 7.5 (Optimal)
- 🔵 Blue: > 7.5 (Too alkaline)

## Future Enhancements

1. **Satellite Screen** (Planned)

   - Dedicated view for satellite data visualization
   - NDVI, NDWI, and Moisture Index maps
   - Historical trend analysis

2. **AI Suggestions** (Planned)
   - More detailed AI recommendations
   - Predictive analytics
   - Crop-specific advice

## Technical Notes

- Auto-refresh uses `Timer.periodic` with 3-second intervals
- Refresh happens without loading state to prevent UI flicker
- Error states maintain previous data on refresh failure
- AI analysis is fetched on-demand to reduce latency
- All sensor values include proper null handling and type conversion

## Troubleshooting

### No data showing

- Check network connection to `10.20.2.18:8000`
- Verify Arduino device is sending data
- Check console for error messages

### Slow AI analysis

- AI endpoint has higher latency (expected)
- Data is cached until manual refresh
- Consider waiting 5-10 seconds after clicking "Load Analysis"

### Auto-refresh not working

- Check if component is properly mounted
- Timer is automatically disposed on screen exit
- Verify controller is initialized in `initState`
