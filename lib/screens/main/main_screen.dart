import 'package:animations/animations.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:valua_staff/routes/app_pages.dart';
import 'package:valua_staff/screens/home/home.dart';
import 'package:valua_staff/screens/main/main_controller.dart';
import 'package:valua_staff/screens/notification/notification.dart';
import 'package:valua_staff/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainController>();

    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: _controller.tabIndex.value == 2
              ? const Size(0, 0)
              : AppBar().preferredSize,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Obx(
              () => _controller.tabIndex.value == 0
                  ? Image.asset(
                      "assets/icons/valua.png",
                      height: 96,
                      width: 96,
                    )
                  : Text(
                      _controller.appBarTitle.value,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  final qrToken = await Get.toNamed(AppRoutes.qr);
                  if (qrToken != null) {
                    _controller.validateLoginQRCode(qrToken);
                  }
                },
                icon: const Icon(CommunityMaterialIcons.qrcode_scan),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Obx(
            () => PageTransitionSwitcher(
              transitionBuilder:
                  (child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                child: child,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
              ),
              child: IndexedStack(
                key: ValueKey<int>(_controller.tabIndex.value),
                index: _controller.tabIndex.value,
                children: const [
                  HomeScreen(),
                  NotificationScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _controller.changeTabIndex,
            currentIndex: _controller.tabIndex.value,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CommunityMaterialIcons.home_outline),
                activeIcon: Icon(CommunityMaterialIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CommunityMaterialIcons.bell_outline),
                activeIcon: Icon(CommunityMaterialIcons.bell),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(CommunityMaterialIcons.account_circle_outline),
                activeIcon: Icon(CommunityMaterialIcons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
