// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      semesterId: json['semesterId'] as String,
      semesterName: json['semesterName'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
      beginDate: json['beginDate'] as String,
      endDate: json['endDate'] as String,
      isActive: json['isActive'] as bool,
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'semesterId': instance.semesterId,
      'semesterName': instance.semesterName,
      'subjects': instance.subjects,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'isActive': instance.isActive,
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };
