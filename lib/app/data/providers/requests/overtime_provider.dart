import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class OvertimeProvider extends DioClient {
  Future<Response> fetchSchedule(idKaryawan) async {
    return await get('${EndPoint.schedule}/$idKaryawan');
  }
  
  Future<Response> postOvertime(FormData formData) async {
    return await post(EndPoint.postOvertime, data: formData);
  }

  Future<Response> fetchLogOvertime() async {
    return await get(EndPoint.logOvertime);
  }
}
