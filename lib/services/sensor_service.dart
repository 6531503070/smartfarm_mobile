import 'package:dio/dio.dart';
import 'package:smartfarm_mobile/config/strapi_config.dart';
import 'package:smartfarm_mobile/services/api_service.dart';

class SensorService {
  final ApiService _apiService = ApiService();
  
  /// Get all sensors
  Future<List<Map<String, dynamic>>> getSensors({String? zoneId}) async {
    try {
      final queryParams = zoneId != null 
          ? {'filters[zone][id][\$eq]': zoneId}
          : null;
      
      final response = await _apiService.dio.get(
        StrapiConfig.sensorsEndpoint,
        queryParameters: queryParams,
      );
      
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((e) => e as Map<String, dynamic>).toList();
      }
      
      return [];
    } on DioException catch (e) {
      print('Get sensors error: ${e.message}');
      return [];
    }
  }
  
  /// Get sensor by ID
  Future<Map<String, dynamic>?> getSensorById(String id) async {
    try {
      final response = await _apiService.dio.get(
        '${StrapiConfig.sensorsEndpoint}/$id',
      );
      
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      
      return null;
    } on DioException catch (e) {
      print('Get sensor error: ${e.message}');
      return null;
    }
  }
  
  /// Get latest sensor readings
  Future<Map<String, dynamic>?> getLatestReadings(String zoneId) async {
    try {
      final response = await _apiService.dio.get(
        StrapiConfig.sensorsEndpoint,
        queryParameters: {
          'filters[zone][id][\$eq]': zoneId,
          'sort[0]': 'createdAt:desc',
          'pagination[limit]': 1,
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        if (data.isNotEmpty) {
          return data.first;
        }
      }
      
      return null;
    } on DioException catch (e) {
      print('Get latest readings error: ${e.message}');
      return null;
    }
  }
}
