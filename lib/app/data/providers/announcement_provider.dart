import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class AnnouncementProvider extends DioClient {
  Future<Response> fetchAnnouncement() async {
    return await get(EndPoint.announcement);
  }
}
