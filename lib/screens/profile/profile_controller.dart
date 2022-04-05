import 'dart:convert';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:valua_staff/constants/app.dart';
import 'package:valua_staff/models/account.dart';
import 'package:valua_staff/providers/auth_provider.dart';
import 'package:valua_staff/repository/auth_repository.dart';
import 'package:valua_staff/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final String to;

  MenuItem({
    required this.icon,
    required this.title,
    required this.to,
  });
}

class ProfileController extends GetxController {
  final List<MenuItem> menuData = [
    MenuItem(
      icon: CommunityMaterialIcons.lock_reset,
      title: "Change password",
      to: AppRoutes.changePassword,
    ),
    MenuItem(
      icon: CommunityMaterialIcons.logout_variant,
      title: "Logout",
      to: AppRoutes.login,
    ),
  ];
  final AuthRepository authRepository = Get.find<AuthProvider>();
  final currentUser = Rx<Account?>(null);
  final GetStorage _storage = GetStorage(AppConstant.storageKey);

  @override
  void onInit() {
    currentUser.value =
        Account.fromJson(jsonDecode(_storage.read(AppConstant.appUser)));
    super.onInit();
  }

  Future<void> refreshUser() async {
    currentUser.value =
        Account.fromJson(jsonDecode(_storage.read(AppConstant.appUser)));
  }

  void handleMenuTap(int index) {
    // if logout
    if (menuData[index].to == AppRoutes.login) {
      GetStorage _storage = GetStorage(AppConstant.storageKey);
      _storage.erase();
    }
    // FIXME: Remove when settings and term is initialize
    if (menuData[index].to == AppRoutes.changePassword) {
      Get.toNamed(menuData[index].to);
    }
  }
}
