import 'package:valua_staff/models/notification_list.dart';

abstract class NotificationRepository {
  Future<NotificationList> getNotifications();
}
