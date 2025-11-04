class StrapiConfig {
  // Change these based on your environment
  static const String baseUrl = 'http://your-strapi-url.com'; // or 'http://10.0.2.2:1337' for Android emulator
  static const String apiVersion = 'api';
  
  // API endpoints
  static const String loginEndpoint = '/auth/local';
  static const String registerEndpoint = '/auth/local/register';
  static const String meEndpoint = '/users/me';
  
  // Custom endpoints for your smart farm
  static const String sensorsEndpoint = '/sensors';
  static const String zonesEndpoint = '/zones';
  static const String irrigationEndpoint = '/irrigation-schedules';
  static const String controlsEndpoint = '/controls';
  
  // Full URLs
  static String get apiUrl => '$baseUrl/$apiVersion';
  static String get loginUrl => '$apiUrl$loginEndpoint';
  static String get registerUrl => '$apiUrl$registerEndpoint';
  static String get meUrl => '$apiUrl$meEndpoint';
  static String get sensorsUrl => '$apiUrl$sensorsEndpoint';
  static String get zonesUrl => '$apiUrl$zonesEndpoint';
  static String get irrigationUrl => '$apiUrl$irrigationEndpoint';
  static String get controlsUrl => '$apiUrl$controlsEndpoint';
}