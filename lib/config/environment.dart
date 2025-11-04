enum Environment { dev, staging, production }

class EnvironmentConfig {
  static Environment current = Environment.dev;
  
  static String get strapiUrl {
    switch (current) {
      case Environment.dev:
        return 'http://10.0.2.2:1337'; // Android emulator
        // return 'http://localhost:1337'; // iOS simulator
      case Environment.staging:
        return 'https://staging-api.yourapp.com';
      case Environment.production:
        return 'https://api.yourapp.com';
    }
  }
}