import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class TeamProvider extends DioClient {
  Future<Response> fetchTeam({date}) async {
    return await get('${EndPoint.team}?startdate=$date');
  }
}
