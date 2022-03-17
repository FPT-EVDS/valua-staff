import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/enums/shift_status.dart';
import 'package:valua_staff/models/account_alternative.dart';

part 'shift.g.dart';

@JsonSerializable()
class Shift {
  String shiftId;
  DateTime beginTime;
  DateTime finishTime;
  AccountAlternative shiftManager;
  ShiftStatus status;

  Shift({
    required this.shiftId,
    required this.beginTime,
    required this.finishTime,
    required this.shiftManager,
    required this.status,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
