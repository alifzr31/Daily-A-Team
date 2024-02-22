import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ChangePasswordProvider extends DioClient {
  Future<Response> changePassword(FormData formData) async {
    return await post(EndPoint.changePassword, data: formData);
  }
}
