import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ChangeShiftProvider extends DioClient {
  Future<Response> fetchSchedule(idKaryawan) async {
    return await get('${EndPoint.schedule}/$idKaryawan');
  }

  Future<Response> fetchOffice() async {
    return await get(EndPoint.fetchOffice);
  }

  Future<Response> postChangeShift(FormData formData) async {
    return await post(
      EndPoint.postChangeShift,
      data: formData,
    );
  }

  Future<Response> fetchLogChangeShift(idKaryawan) async {
    return await get('${EndPoint.logChangeShift}/$idKaryawan');
  }

  Future<Response> cancelChangeShift(FormData formData) async {
    return await post(
      EndPoint.cancelChangeShift,
      data: formData,
    );
  }
}
