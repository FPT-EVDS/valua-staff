import 'package:valua_staff/providers/notification_provider.dart';
import 'package:get/get.dart';
import 'package:valua_staff/screens/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationProvider>(() => NotificationProvider());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
