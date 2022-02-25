// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterList _$SemesterListFromJson(Map<String, dynamic> json) => SemesterList(
      totalItems: json['totalItems'] as int,
      totalPages: json['totalPages'] as int,
      semesters: (json['semesters'] as List<dynamic>)
          .map((e) => Semester.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['currentPage'] as int,
    );

Map<String, dynamic> _$SemesterListToJson(SemesterList instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'semesters': instance.semesters,
      'currentPage': instance.currentPage,
    };
