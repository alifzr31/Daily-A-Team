import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class LogAttendanceProvider extends DioClient {
  Future<Response> fetchLogAttendance() async {
    return await get(EndPoint.logAttendance);
  }
}