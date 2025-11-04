import 'package:dio/dio.dart';
import 'package:smartfarm_mobile/config/strapi_config.dart';
import 'package:smartfarm_mobile/services/api_service.dart';

class IrrigationService {
  final ApiService _apiService = ApiService();
  
  /// Get irrigation schedules
  Future<List<Map<String, dynamic>>> getSchedules({String? zoneId}) async {
    try {
      final queryParams = zoneId != null 
          ? {'filters[zone][id][\$eq]': zoneId}
          : null;
      
      final response = await _apiService.dio.get(
        StrapiConfig.irrigationEndpoint,
        queryParameters: queryParams,
      );
      
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((e) => e as Map<String, dynamic>).toList();
      }
      
      return [];
    } on DioException catch (e) {
      print('Get schedules error: ${e.message}');
      return [];
    }
  }
  
  /// Create irrigation schedule
  Future<Map<String, dynamic>?> createSchedule({
    required String zoneId,
    required String startTime,
    required String endTime,
    required bool repeatWeekly,
  }) async {
    try {
      final response = await _apiService.dio.post(
        StrapiConfig.irrigationEndpoint,
        data: {
          'data': {
            'zone': zoneId,
            'startTime': startTime,
            'endTime': endTime,
            'repeatWeekly': repeatWeekly,
            'isActive': true,
          },
        },
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['data'];
      }
      
      return null;
    } on DioException catch (e) {
      print('Create schedule error: ${e.message}');
      return null;
    }
  }
  
  /// Delete irrigation schedule
  Future<bool> deleteSchedule(String scheduleId) async {
    try {
      final response = await _apiService.dio.delete(
        '${StrapiConfig.irrigationEndpoint}/$scheduleId',
      );
      
      return response.statusCode == 200;
    } on DioException catch (e) {
      print('Delete schedule error: ${e.message}');
      return false;
    }
  }
  
  /// Manual control - Start irrigation
  Future<bool> startIrrigation(String zoneId) async {
    try {
      final response = await _apiService.dio.post(
        '${StrapiConfig.controlsEndpoint}/start',
        data: {
          'data': {
            'zone': zoneId,
            'action': 'start',
            'timestamp': DateTime.now().toIso8601String(),
          },
        },
      );
      
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print('Start irrigation error: ${e.message}');
      return false;
    }
  }
  
  /// Manual control - Stop irrigation
  Future<bool> stopIrrigation(String zoneId) async {
    try {
      final response = await _apiService.dio.post(
        '${StrapiConfig.controlsEndpoint}/stop',
        data: {
          'data': {
            'zone': zoneId,
            'action': 'stop',
            'timestamp': DateTime.now().toIso8601String(),
          },
        },
      );
      
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print('Stop irrigation error: ${e.message}');
      return false;
    }
  }
}