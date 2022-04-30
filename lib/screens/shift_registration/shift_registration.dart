import 'package:community_material_icon/community_material_icon.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:valua_staff/models/shifts_registration.dart';
import 'package:valua_staff/screens/shift_registration/shift_registration_controller.dart';
import 'package:valua_staff/utils/time.dart';
import 'package:valua_staff/widgets/round_button.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class ShiftRegistrationScreen extends StatelessWidget {
  const ShiftRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ShiftRegistrationController>();

    Future<dynamic> showConfirmDialog() {
      return CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          showCancelBtn: true,
          title:
              "Register ${_controller.listSelectedShifts.length} selected shifts ?",
          text: "This action can't be reverted",
          onConfirmBtnTap: () async {
            try {
              await _controller.registerShifts();
              Get.back();
              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: "Register successfully",
              );
              await _controller.getAvailableShifts();
            } catch (e) {
              Get.back();
              CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                text: e.toString(),
              );
            }
          });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shift registration"),
          actions: [
            IconButton(
                onPressed: () async {
                  await _controller.getAvailableShifts();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: _controller.listSelectedShifts.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundButton(
                label: 'Register',
                onPressed: () {
                  showConfirmDialog();
                },
                height: 48,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(
              () => FutureBuilder(
                future: _controller.availableShifts.value,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as ShiftsRegistration;
                    if (data.shifts.isNotEmpty) {
                      final _availableShifts =
                          _controller.getAvailableShiftByDate(data.shifts);
                      final _availableShiftsKeys =
                          _availableShifts.keys.toList();
                      return Obx(() => ExpansionPanelList(
                          expandedHeaderPadding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                          elevation: 2,
                          expansionCallback: (int index, bool isExpanded) {
                            _controller.isExpandedList[index] = !isExpanded;
                          },
                          children: _availableShifts.entries.map((e) {
                            final index = _availableShiftsKeys.indexOf(e.key);
                            return ExpansionPanel(
                              isExpanded: _controller.isExpandedList[index],
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return CheckboxListTile(
                                  title: Text(
                                    e.key,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: _controller
                                          .checkIfShiftsHasCrossTimeShift(
                                              e.value)
                                      ? null
                                      : (bool? value) {
                                          if (value == true) {
                                            _controller.listSelectedShifts
                                                .addAll(e.value);
                                          } else {
                                            _controller.listSelectedShifts
                                                .removeAll(e.value);
                                          }
                                        },
                                  value: _controller.listSelectedShifts
                                      .containsAll(e.value),
                                );
                              },
                              body: Column(
                                  children: e.value
                                      .map(
                                        (shift) => CheckboxListTile(
                                          tileColor: Colors.white,
                                          title: Text(
                                              "${_controller.timeFormatter.format(shift.beginTime.toLocal())} - ${_controller.timeFormatter.format(shift.finishTime.toLocal())}"),
                                          subtitle: Text(
                                              'Remaining slots: ${shift.availableSlots}'),
                                          secondary: Icon(
                                            TimeUtils.isNight(
                                                    shift.beginTime.toLocal())
                                                ? CommunityMaterialIcons
                                                    .moon_full
                                                : CommunityMaterialIcons
                                                    .white_balance_sunny,
                                            color: TimeUtils.isNight(
                                                    shift.beginTime.toLocal())
                                                ? Colors.purple
                                                : Colors.orange,
                                            size: 32,
                                          ),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged:
                                              _controller.checkIfShiftCrossTime(
                                            _controller.listSelectedShifts
                                                .toList(),
                                            shift,
                                          )
                                                  ? null
                                                  : (bool? value) {
                                                      if (value == true) {
                                                        _controller
                                                            .listSelectedShifts
                                                            .add(shift);
                                                      } else {
                                                        _controller
                                                            .listSelectedShifts
                                                            .remove(shift);
                                                      }
                                                    },
                                          value: _controller.listSelectedShifts
                                              .contains(shift),
                                        ),
                                      )
                                      .toList()),
                            );
                          }).toList()));
                    }
                    return Center(
                      child: Column(children: [
                        SvgPicture.asset(
                          'assets/images/relax.svg',
                          width: 350,
                          semanticsLabel: "Schedule illustration",
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "No shifts available!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ]),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(children: [
                        SvgPicture.asset(
                          'assets/images/relax.svg',
                          width: 350,
                          semanticsLabel: "Schedule illustration",
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Something wrong ! Please refresh the page",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ]),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
