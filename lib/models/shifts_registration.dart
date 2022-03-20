import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/enums/shift_status.dart';
part 'shifts_registration.g.dart';

@JsonSerializable()
class ShiftsRegistration {
  List<ShiftsRegistrationDetail> shifts;

  ShiftsRegistration({required this.shifts});

  factory ShiftsRegistration.fromJson(Map<String, dynamic> json) =>
      _$ShiftsRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftsRegistrationToJson(this);
}

@JsonSerializable()
class ShiftsRegistrationDetail {
  String shiftId;
  DateTime beginTime;
  DateTime finishTime;
  int availableSlots;
  ShiftStatus status;

  ShiftsRegistrationDetail({
    required this.availableSlots,
    required this.beginTime,
    required this.finishTime,
    required this.shiftId,
    required this.status,
  });

  factory ShiftsRegistrationDetail.fromJson(Map<String, dynamic> json) =>
      _$ShiftsRegistrationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftsRegistrationDetailToJson(this);
}
