class SensorData {
  // Soil Moisture sensor data
  static const String soilMoistureValue = "50%";
  static const String soilMoistureIcon =
      "moisture"; // bootstrap.BootstrapIcons.moisture

  // Humidity sensor data
  static const String humidityValue = "70%";
  static const String humidityIcon =
      "cloudSunRain"; // lucide.LucideIcons.cloudSunRain

  // Temperature sensor data
  static const String temperatureValue = "42°C";
  static const String temperatureIcon =
      "thermometer_sun"; // bootstrap.BootstrapIcons.thermometer_sun

  // Rain status data
  static const String rainStatus = "notRaining"; // This will be localized
  static const String rainIcon =
      "cloud_rain"; // bootstrap.BootstrapIcons.cloud_rain

  // Default time values
  static const int defaultHour = 0;
  static const int defaultMinute = 0;

  // Sensor thresholds (for future use)
  static const double soilMoistureThreshold = 30.0; // percentage
  static const double humidityThreshold = 60.0; // percentage
  static const double temperatureThreshold = 35.0; // celsius
}
