import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/semester.dart';
import 'package:valua_staff/screens/shift/shift_controller.dart';

class ShiftScreen extends StatelessWidget {
  const ShiftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat _timeFormat = DateFormat("HH:mm");
    final _controller = Get.find<ShiftController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Assigned shift"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                future: _controller.getListSemesters(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            Expanded(
              child: Obx(
                () => FutureBuilder(
                  future: _controller.assignedShiftList.value,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      AssignedShift data = snapshot.data;
                      final assignShiftDetail = data.assignedShifts;
                      if (assignShiftDetail.isEmpty) {
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
                                "No shift assigned",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          await _controller.getAssignedShift(
                              semesterId: _controller
                                  .currentSemester?.value.semesterId);
                        },
                        child: ListView.builder(
                            itemCount: data.totalItems,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text(
                                      "Date: " +
                                          DateFormat('dd/MM/yyyy').format(
                                              assignShiftDetail[index]
                                                  .shift
                                                  .beginTime),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Room: ${assignShiftDetail[index].room.roomName}",
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${_timeFormat.format(assignShiftDetail[index].shift.beginTime)} "
                                          "- ${_timeFormat.format(assignShiftDetail[index].shift.finishTime)}",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
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
            ),
          ],
        ),
      ),
    );
  }
}
