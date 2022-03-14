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
      type: $enumDecode(_$NotificationStatusEnumMap, json['type']),
      header: json['header'] as String,
      content: json['content'] as String,
      route: json['route'] as String,
    );

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'type': _$NotificationStatusEnumMap[instance.type],
      'header': instance.header,
      'content': instance.content,
      'route': instance.route,
    };

const _$NotificationStatusEnumMap = {
  NotificationStatus.assigned: 2,
  NotificationStatus.pendingReport: 3,
  NotificationStatus.resolvedReport: 4,
};
