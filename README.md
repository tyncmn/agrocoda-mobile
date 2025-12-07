# Agrocoda Mobile 🌱

A Flutter-based agricultural monitoring application that provides real-time sensor data analysis and AI-powered insights for smart farming.

## Overview

Agrocoda Mobile connects to Arduino-based IoT devices to monitor soil conditions, environmental parameters, and provides actionable agricultural insights powered by AI and satellite data analysis.

## Features

### 🌾 Real-Time Monitoring
- **Live Sensor Data**: Auto-refreshing data every 3 seconds
- **Comprehensive Metrics**: Temperature, humidity, soil moisture, pH, NPK levels, and more
- **No Loading Delays**: Seamless data updates without UI interruptions

### 📊 Interactive Dashboard
- Quick stats cards for key metrics
- Visual sensor grid with color-coded indicators
- Pull-to-refresh support
- Responsive design following Agrocoda brand guidelines

### 🤖 AI-Powered Insights
- Overall field health status
- Risk assessment with confidence levels
- Nutrient balance analysis (Nitrogen, Phosphorus, Potassium, pH)
- Environmental status tracking (moisture, gas, seismic)
- Satellite data integration (NDVI, NDWI, Moisture Index)
- Personalized recommendations for farmers

### 📱 Additional Features
- Field management
- Sensor configuration
- User profiles
- Historical data tracking

## Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: Riverpod
- **Routing**: AutoRoute
- **Network**: Dio + Retrofit
- **Charts**: FL Chart
- **Design**: Material Design 3

## Project Structure

```
lib/
├── app.dart                    # Main app widget
├── main.dart                   # App entry point
├── controllers/                # State management
│   ├── dashboard_controller.dart
│   ├── data_controller.dart
│   └── field_controller.dart
├── models/                     # Data models
│   ├── models.dart
│   └── request.dart
├── router/                     # Navigation
│   ├── auto_router.dart
│   └── auto_router.gr.dart
├── services/                   # API & Business logic
│   ├── repository.dart
│   ├── services.dart
│   └── services.g.dart
├── utils/                      # Utilities
│   ├── assets_const.dart
│   └── extension.dart
├── view/                       # UI screens
│   ├── dashboard_view.dart     # Real-time dashboard
│   ├── home_view.dart
│   ├── login_view.dart
│   └── ...
└── widgets/                    # Reusable components
    ├── dashboard_navigation.dart
    ├── crop_status_card.dart
    └── ...
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- iOS Simulator / Android Emulator / Physical Device
- Arduino device with sensors configured

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/cookers-404/cookers-mobile.git
   cd cookers-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Configure API endpoint**
   - Default: `http://10.20.2.18:8000`
   - Update in `lib/services/services.dart` if needed

5. **Run the app**
   ```bash
   flutter run
   ```

## API Endpoints

### Real-Time Data
```
GET /items/bare
```
Returns live sensor readings from Arduino device.

### AI Analysis
```
GET /items/recent
```
Returns comprehensive analysis with satellite data and AI insights.

### Authentication
```
POST /login
```
User authentication endpoint.

### Field Management
```
GET /fields
POST /field
POST /field/{id}
GET /data/{id}/all
```

## Configuration

### Base URL
Edit `lib/services/services.dart`:
```dart
@RestApi(baseUrl: 'http://your-api-url:port/')
abstract class Services {
  // ...
}
```

### Theme Colors
Primary color: `#29B674` (Agrocoda Green)  
Configured in `lib/app.dart` and `lib/utils/extension.dart`

### Font
Default font family: **Tommy**  
Located in `assets/fonts/`

## Usage

### Navigate to Dashboard
```dart
import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/router/auto_router.dart';

// From any screen
context.router.push(const DashboardRoute());
```

### Using Navigation Widgets
```dart
// Button
const DashboardNavigationButton()

// Floating Action Button
const DashboardFAB()

// Preview Card
const DashboardPreviewCard()
```

## Development

### Generate Routes
After adding new views with `@RoutePage()`:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Format Code
```bash
dart format .
```

### Run Tests
```bash
flutter test
```

### Build for Production
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## Environment Setup

### Android
- Minimum SDK: 21
- Target SDK: 34

### iOS
- Minimum iOS: 12.0
- Deployment Target: iOS 12.0+

## Sensor Data Parameters

| Parameter | Unit | Description |
|-----------|------|-------------|
| Temperature | °C | Air temperature |
| Humidity | % | Relative humidity |
| Moisture | % | Soil moisture content |
| pH | - | Soil pH level |
| Nitrogen | ppm | Nitrogen concentration |
| Phosphorus | ppm | Phosphorus concentration |
| Potassium | ppm | Potassium concentration |
| Gas | ppm | Combustible gas levels |
| Pressure | hPa | Atmospheric pressure |
| Oxygen | % | Oxygen concentration |
| Methane | ppm | Methane levels |
| Ammonium | ppb | Ammonium concentration |

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Troubleshooting

### Build Runner Issues
```bash
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### No Data Showing
- Verify Arduino device is connected and sending data
- Check network connection to API endpoint
- Ensure API server is running at configured URL

### Import Errors
Run code generation:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## License

This project is proprietary software developed by Cookers-404.

## Support

For issues, questions, or contributions, please contact the development team or open an issue in the repository.

---

**Built with ❤️ for sustainable agriculture**
