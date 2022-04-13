import 'package:json_annotation/json_annotation.dart';
part 'semester.g.dart';

@JsonSerializable()
class Semester {
  String semesterId;
  String semesterName;
  DateTime beginDate;
  DateTime endDate;
  bool isActive;

  Semester({
    required this.semesterId,
    required this.semesterName,
    required this.beginDate,
    required this.endDate,
    required this.isActive,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
