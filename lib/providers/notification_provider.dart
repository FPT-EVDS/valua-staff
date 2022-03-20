import 'package:valua_staff/models/notification_list.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/notification_repository.dart';

class NotificationProvider extends BaseProvider
    implements NotificationRepository {
  @override
  Future<NotificationList> getNotifications() async {
    final response = await get("/notifications");
    if (response.status.hasError) {
      throw (response.body);
    }
    return NotificationList.fromJson(response.body);
  }
}
