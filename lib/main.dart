import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:valua_staff/constants/app.dart';
import 'package:valua_staff/providers/auth_provider.dart';
import 'package:valua_staff/routes/routes.dart';
import 'package:valua_staff/services/auth_service.dart';
import 'package:valua_staff/services/firebase_messaging_service.dart';
import 'package:valua_staff/services/local_notification_service.dart';
import 'package:valua_staff/theme/theme.dart';

// Receive message when app is in background
// Solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification?.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/font/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await Get.putAsync(() => GetStorage.init(AppConstant.storageKey));
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(AuthProvider());
    Get.put(FirebaseMessagingService());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final GetStorage _storage = GetStorage(AppConstant.storageKey);
    LocalNotificationService.init(context);
    return GetMaterialApp(
      title: 'Valua Staff',
      theme: AppThemes(context).defaultTheme,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
      initialRoute: _storage.read(AppConstant.accessToken) != null
          ? AppRoutes.main
          : AppRoutes.login,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
