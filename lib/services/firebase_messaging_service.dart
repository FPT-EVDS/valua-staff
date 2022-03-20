import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:valua_staff/constants/app.dart';
import 'package:valua_staff/models/account.dart';
import 'package:valua_staff/services/local_notification_service.dart';

class FirebaseMessagingService extends GetxService {
  final _storage = GetStorage(AppConstant.storageKey);
  String currentSubscribeTopic = '';

  @override
  void onInit() {
    super.onInit();

    // Gives you the message on which user taps
    // and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        final routeFromMessage = value.data["route"];
        Get.toNamed(routeFromMessage);
      }
    });

    // foreground task
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      LocalNotificationService.showNotification(remoteMessage);
    });

    // When the app is in background but opened and user tap
    // on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final routeFromMessage = event.data["route"];
      Get.toNamed(routeFromMessage);
    });

    _storage.listenKey(AppConstant.appUser, (value) {
      if (value != null) {
        final user = Account.fromJson(jsonDecode(value));
        currentSubscribeTopic = user.companyId;
        FirebaseMessaging.instance.subscribeToTopic(currentSubscribeTopic);
        FirebaseMessaging.instance.subscribeToTopic(AppConstant.staffTopic);
      } else {
        if (currentSubscribeTopic.isNotEmpty) {
          FirebaseMessaging.instance
              .unsubscribeFromTopic(currentSubscribeTopic);
          FirebaseMessaging.instance
              .unsubscribeFromTopic(AppConstant.staffTopic);
        }
      }
    });
  }
}
