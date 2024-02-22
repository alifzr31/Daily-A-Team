import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class DashboardProvider extends DioClient {
  Future<Response> fetchLevKar() async {
    return await get(EndPoint.levKar);
  }

  Future<Response> fetchProfile() async {
    return await get(EndPoint.profile);
  }

  Future<Response> fetchLogAttendance() async {
    return await get(EndPoint.logAttendance);
  }

  Future<Response> fetchBreakTime(karId) async {
    return await get('${EndPoint.breakTime}/$karId');
  }

  Future<Response> postBreakTime(FormData formData) async {
    return await post(EndPoint.postBreaktime, data: formData);
  }

  Future<Response> fetchAnnouncement() async {
    return await get(EndPoint.announcement);
  }

  Future<Response> fetchEmployee(page, searchEmployee) async {
    return await get(
      EndPoint.employee,
      queryParams: {
        'page': page,
        'searchEmployee': searchEmployee,
      },
    );
  }

  Future<Response> fetchInboxStaff() async {
    return await get(EndPoint.inboxStaff);
  }

  Future<Response> markReadStaff(id) async {
    return await post('${EndPoint.markReadStaff}/$id');
  }

  Future<Response> fetchInboxManager() async {
    return await get(EndPoint.inboxManager);
  }

  Future<Response> markReadManager(id) async {
    return await post('${EndPoint.markReadManager}/$id');
  }

  Future<Response> changePhotoProfile(FormData formData, idKaryawan) async {
    return await post(
      '${EndPoint.changePhotoProfile}/$idKaryawan',
      data: formData,
    );
  }

  Future<Response> logout() async {
    return await post(EndPoint.logout);
  }
}
