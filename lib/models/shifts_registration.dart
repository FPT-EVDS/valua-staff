import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/models/shift.dart';
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
class ShiftsRegistrationDetail extends Shift {
  int availableSlots;

  ShiftsRegistrationDetail({
    required this.availableSlots,
    required beginTime,
    required finishTime,
    required shiftId,
    required status,
  }) : super(
          beginTime: DateTime.parse(beginTime),
          finishTime: DateTime.parse(finishTime),
          shiftId: shiftId,
          status: status,
        );

  factory ShiftsRegistrationDetail.fromJson(Map<String, dynamic> json) =>
      _$ShiftsRegistrationDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShiftsRegistrationDetailToJson(this);
}
