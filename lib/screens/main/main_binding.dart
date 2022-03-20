import 'package:valua_staff/providers/exam_room_provider.dart';
import 'package:valua_staff/providers/notification_provider.dart';
import 'package:valua_staff/providers/qr_provider.dart';
import 'package:valua_staff/providers/shift_provider.dart';
import 'package:valua_staff/screens/home/home_controller.dart';
import 'package:valua_staff/screens/main/main_controller.dart';
import 'package:valua_staff/providers/auth_provider.dart';
import 'package:valua_staff/screens/notification/notification_controller.dart';
import 'package:valua_staff/screens/profile/profile_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<NotificationProvider>(() => NotificationProvider());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ShiftProvider>(() => ShiftProvider());
    Get.lazyPut<QRProvider>(() => QRProvider());
    Get.lazyPut<ExamRoomProvider>(() => ExamRoomProvider());
  }
}
