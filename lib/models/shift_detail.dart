import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/models/room.dart';
import 'package:valua_staff/models/subject.dart';
part 'shift_detail.g.dart';

@JsonSerializable()
class ShiftDetail {
  @JsonKey(name: "examRoomID")
  String examRoomId;
  String examRoomName;
  Shift shift;
  Subject subject;
  Room room;

  ShiftDetail({
    required this.examRoomId,
    required this.examRoomName,
    required this.shift,
    required this.subject,
    required this.room,
  });

  factory ShiftDetail.fromJson(Map<String, dynamic> json) =>
      _$ShiftDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftDetailToJson(this);
}

@JsonSerializable()
class Shift {
  String shiftId;
  DateTime beginTime;
  DateTime finishTime;

  Shift({
    required this.shiftId,
    required this.beginTime,
    required this.finishTime,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
