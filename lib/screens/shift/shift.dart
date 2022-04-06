import 'package:community_material_icon/community_material_icon.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/semester.dart';
import 'package:valua_staff/models/shift_detail.dart';
import 'package:valua_staff/screens/shift/shift_controller.dart';
import 'package:valua_staff/utils/time.dart';

class ShiftScreen extends StatelessWidget {
  const ShiftScreen({Key? key}) : super(key: key);

  Widget _buildShiftCard(BuildContext context, ShiftDetail shiftDetail) {
    final DateFormat _timeFormat = DateFormat("HH:mm");
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            DateFormat('dd/MM/yyyy')
                .format(shiftDetail.shift.beginTime.toLocal()),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Room: ${shiftDetail.room.roomName}",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          leading: Icon(
            TimeUtils.isNight(shiftDetail.shift.beginTime.toLocal())
                ? CommunityMaterialIcons.moon_full
                : CommunityMaterialIcons.white_balance_sunny,
            color: TimeUtils.isNight(shiftDetail.shift.beginTime.toLocal())
                ? Colors.purple
                : Colors.orange,
            size: 32,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${_timeFormat.format(shiftDetail.shift.beginTime.toLocal())} "
                "- ${_timeFormat.format(shiftDetail.shift.finishTime.toLocal())}",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ShiftController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Assigned shift"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder(
                    future: _controller.getListSemesters(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 300,
                          child: DropdownSearch<Semester>(
                            mode: Mode.DIALOG,
                            popupTitle: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Choose semester",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            showSelectedItems: true,
                            itemAsString: (item) => item!.semesterName,
                            compareFn: (item, selectedItem) =>
                                item!.semesterId == selectedItem!.semesterId,
                            items: snapshot.data,
                            dropdownSearchDecoration: const InputDecoration(
                              labelText: "Semester",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                            ),
                            onChanged: _controller.handleChangeSemester,
                            selectedItem: _controller.currentSemester?.value ??
                                snapshot.data[0],
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Obx(
                  () => FutureBuilder(
                    future: _controller.assignedShiftList.value,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        AssignedShift data = snapshot.data;
                        final currentShift = data.currentShift;
                        final nextShift = data.nextShift;
                        final upcomingShifts = data.upcomingShifts;
                        final finishedShifts = data.finishedShifts;
                        if (currentShift == null && nextShift == null) {
                          _controller.isExpandedList[0] = false;
                        }
                        if (upcomingShifts != null) {
                          _controller.isExpandedList[1] = false;
                        }
                        if (finishedShifts != null) {
                          _controller.isExpandedList[2] = false;
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            await _controller.getAssignedShift(
                              semesterId:
                                  _controller.currentSemester?.value.semesterId,
                            );
                          },
                          child: Obx(
                            () => ExpansionPanelList(
                              expandedHeaderPadding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              elevation: 2,
                              expansionCallback: (int index, bool isExpanded) {
                                _controller.isExpandedList[index] = !isExpanded;
                              },
                              children: [
                                ExpansionPanel(
                                  isExpanded: _controller.isExpandedList[0],
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        currentShift != null
                                            ? "Current shift"
                                            : "Next shift",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                  body: currentShift != null
                                      ? _buildShiftCard(
                                          context,
                                          currentShift,
                                        )
                                      : nextShift != null
                                          ? _buildShiftCard(
                                              context,
                                              nextShift,
                                            )
                                          : Container(),
                                ),
                                ExpansionPanel(
                                  isExpanded: _controller.isExpandedList[1],
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        _controller.sectionTitles[1],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                  body: upcomingShifts != null
                                      ? Column(
                                          children: upcomingShifts
                                              .map((upcomingShift) =>
                                                  _buildShiftCard(
                                                    context,
                                                    upcomingShift,
                                                  ))
                                              .toList(),
                                        )
                                      : Container(),
                                ),
                                ExpansionPanel(
                                  isExpanded: _controller.isExpandedList[2],
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        _controller.sectionTitles[2],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                  body: finishedShifts != null
                                      ? Column(
                                          children: finishedShifts
                                              .map((finishedShift) =>
                                                  _buildShiftCard(
                                                    context,
                                                    finishedShift,
                                                  ))
                                              .toList(),
                                        )
                                      : Container(),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/no_shift.svg",
                              height: 180,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "There is no exams in this semester",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
