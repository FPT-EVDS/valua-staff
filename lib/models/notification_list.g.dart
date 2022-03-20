// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) =>
    NotificationList(
      totalItems: json['totalItems'] as int,
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationListToJson(NotificationList instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'notifications': instance.notifications,
    };

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) =>
    NotificationItem(
      notificationId: json['notificationId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      header: json['header'] as String,
      content: json['content'] as String,
      route: json['route'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'type': _$NotificationTypeEnumMap[instance.type],
      'header': instance.header,
      'content': instance.content,
      'route': instance.route,
      'createdDate': instance.createdDate.toIso8601String(),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.assigned: 2,
  NotificationType.pendingReport: 3,
  NotificationType.resolvedReport: 4,
  NotificationType.shiftOpen: 5,
};
