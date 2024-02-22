import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ApproveProvider extends DioClient {
  Future<Response> fetchReqAttendance() async {
    return await get(EndPoint.fetchReqAttendance);
  }

  Future<Response> approveReqAttendance(FormData formData, id) async {
    return await post(
      '${EndPoint.approveReqAttendance}/$id',
      data: formData,
    );
  }

  Future<Response> fetchReqTimeOff() async {
    return await get(EndPoint.fetchTimeOff);
  }

  Future<Response> approveReqTimeOff(FormData formData, id) async {
    return await post(
      '${EndPoint.approveReqTimeOff}/$id',
      data: formData,
    );
  }

  Future<Response> fetchReqChangeShift() async {
    return await get(EndPoint.fetchChangeShift);
  }

  Future<Response> approveReqChangeShift(FormData formData) async {
    return await post(
      EndPoint.approveReqChangeShift,
      data: formData,
    );
  }

  Future<Response> fetchReqOvertime() async {
    return await get(EndPoint.fetchReqOvertime);
  }

  Future<Response> approveReqOvertime(FormData formData) async {
    return await post(
      EndPoint.approveReqOvertime,
      data: formData,
    );
  }
}
