import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/enums/notification_status.dart';
part 'notification_list.g.dart';

@JsonSerializable()
class NotificationList {
  int totalItems;
  int totalPages;
  int currentPage;
  List<NotificationItem> notifications;

  NotificationList({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.notifications,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationListFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}

@JsonSerializable()
class NotificationItem {
  String notificationId;
  NotificationStatus type;
  String header;
  String content;
  String route;

  NotificationItem({
    required this.notificationId,
    required this.type,
    required this.header,
    required this.content,
    required this.route,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);
}
