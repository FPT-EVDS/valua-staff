import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valua_staff/screens/notification/notification_controller.dart';

class LocalNotificationService extends GetxController {
  static final hasUnreadMessage = false.obs;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void init(BuildContext context) {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        Get.toNamed(route);
      }
    });
  }

  static void showNotification(RemoteMessage message) async {
    try {
      final _notifcationController = Get.find<NotificationController>();
      final id = DateTime.now().millisecond ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "valua_staff",
        "valua_staff_channel",
        importance: Importance.max,
        priority: Priority.high,
      ));
      await _notificationsPlugin.show(id, message.notification?.title,
          message.notification?.body, notificationDetails,
          payload: message.data["route"]);
      _notifcationController.getNotifications();
      hasUnreadMessage.value = true;
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.grey.shade700,
      );
    }
  }

  static void enableReadAllMessage() {
    hasUnreadMessage.value = true;
  }
}
