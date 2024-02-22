import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ScheduleProvider extends DioClient {
  Future<Response> fetchSchedule(idKaryawan) async {
    return await get('${EndPoint.schedule}/$idKaryawan');
  }
}