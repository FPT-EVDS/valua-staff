import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/routes/app_pages.dart';
import 'package:valua_staff/screens/home/home_controller.dart';
import 'package:valua_staff/widgets/card_with_icon.dart';
import 'package:valua_staff/widgets/shift_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<HomeController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Today's exam",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: _controller.assignedShiftList.value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  AssignedShift data = snapshot.data;
                  final assignedShiftDetail = data.assignedShifts[0];
                  return ShiftCard(
                    onTap: () {
                      Get.toNamed(AppRoutes.shift, arguments: {
                        "semesterId": data.selectedSemester.semesterId
                      });
                    },
                    thumbnail: SvgPicture.asset(
                      'assets/images/exam.svg',
                      semanticsLabel: "Schedule illustration",
                      height: 100,
                    ),
                    beginTime: assignedShiftDetail.shift.beginTime,
                    endTime: assignedShiftDetail.shift.finishTime,
                    date: assignedShiftDetail.shift.beginTime,
                    location: assignedShiftDetail.room.roomName,
                  );
                } else if (snapshot.hasError) {
                  return Card(
                    elevation: 2,
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Column(children: [
                        SvgPicture.asset(
                          'assets/images/relax.svg',
                          semanticsLabel: "Schedule illustration",
                          height: 100,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "No exams available!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ]),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Information access",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                CardWithIcon(
                  icon: Icon(
                    CommunityMaterialIcons.calendar_month,
                    size: 70,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: "Assigned shift",
                  onTap: () {
                    Get.toNamed(AppRoutes.shift);
                  },
                ),
                CardWithIcon(
                  icon: Icon(
                    CommunityMaterialIcons.calendar_plus,
                    size: 70,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: "Shift registration",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
