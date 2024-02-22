import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class BreakTimeProvider extends DioClient {
  Future<Response> fetchBreakTime(idKaryawan) async {
    return await get('${EndPoint.breakTime}/$idKaryawan');
  }
}