import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/models/room.dart';
import 'package:valua_staff/models/shift.dart';
import 'package:valua_staff/models/subject.dart';
part 'shift_detail.g.dart';

@JsonSerializable()
class ShiftDetail {
  String examRoomId;
  Shift shift;
  Room room;

  ShiftDetail({
    required this.examRoomId,
    required this.shift,
    required this.room,
  });

  factory ShiftDetail.fromJson(Map<String, dynamic> json) =>
      _$ShiftDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftDetailToJson(this);
}
