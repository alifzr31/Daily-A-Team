import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ReqAttendanceProvider extends DioClient {
  Future<Response> postReqAttendance(FormData formData) async {
    return await post(EndPoint.postReqAttendance, data: formData);
  }

  Future<Response> fetchLogReqAttendance(idKaryawan) async {
    return await get('${EndPoint.logReqAttendance}/$idKaryawan');
  }

  Future<Response> cancelReqAttendance(FormData formData) async {
    return await post(
      EndPoint.cancelReqAttendance,
      data: formData,
    );
  }
}
