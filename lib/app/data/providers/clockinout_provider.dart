import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ClockInOutProvider extends DioClient {
  Future<Response> clockInOut(FormData formData) async {
    return await post(EndPoint.clockInOut, data: formData);
  }
}
