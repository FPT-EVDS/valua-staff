import 'package:valua_staff/models/notification_list.dart';
import 'package:valua_staff/screens/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationController _controller =
        Get.find<NotificationController>();
    return RefreshIndicator(
      onRefresh: () async {
        await _controller.getNotifications();
      },
      child: Obx(
        () => FutureBuilder(
            future: _controller.notifications.value,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                NotificationList data = snapshot.data;
                if (data.notifications.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final notification = data.notifications[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          child: const Icon(Icons.notifications),
                        ),
                        title: Text(notification.header),
                        subtitle: Text(
                          notification.content,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Get.toNamed(notification.route);
                        },
                      );
                    },
                    itemCount: data.notifications.length,
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/notify.svg",
                          height: 120,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "No notifications yet!",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 250,
                          child: Text(
                            "We will notify you once we have something for you",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/notify.svg",
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
