import 'package:evds_staff/screens/evidence/evidence_controller.dart';
import 'package:evds_staff/screens/main/main_controller.dart';
import 'package:evds_staff/providers/auth_provider.dart';
import 'package:evds_staff/screens/notification/notification_controller.dart';
import 'package:evds_staff/screens/profile/profile_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<EvidenceController>(() => EvidenceController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
