import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class TimeOffProvider extends DioClient {
  Future<Response> fetchCuti(idKaryawan) async {
    return await get('${EndPoint.fetchCuti}/$idKaryawan');
  }

  Future<Response> fetchChoice() async {
    return await get(EndPoint.choiceTimeOff);
  }

  Future<Response> fetchLogTimeOff(idKaryawan) async {
    return await get('${EndPoint.logTimeOff}/$idKaryawan');
  }

  Future<Response> postTimeOff(FormData formData) async {
    return await post(EndPoint.postTimeOff, data: formData);
  }

  Future<Response> cancelTimeOff(FormData formData) async {
    return await post(EndPoint.cancelTimeOff, data: formData);
  }
}
