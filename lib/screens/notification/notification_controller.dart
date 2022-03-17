import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valua_staff/models/notification_list.dart';
import 'package:valua_staff/providers/notification_provider.dart';
import 'package:valua_staff/repository/notification_repository.dart';

class NotificationController extends GetxController {
  final notifications = Future<NotificationList?>.value().obs;
  final NotificationRepository _provider = Get.find<NotificationProvider>();

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future<NotificationList?> getNotifications() {
    try {
      final data = _provider.getNotifications();
      notifications.value = data;
      return data;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.grey.shade700,
      );
      throw Exception(e);
    }
  }
}
