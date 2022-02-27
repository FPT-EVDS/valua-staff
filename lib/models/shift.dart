import 'package:json_annotation/json_annotation.dart';
part 'shift.g.dart';

@JsonSerializable()
class Shift {
  String shiftId;
  DateTime beginTime;
  DateTime finishTime;
  int status;

  Shift({
    required this.shiftId,
    required this.beginTime,
    required this.finishTime,
    required this.status,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
