import 'package:valua_staff/models/semester_list.dart';

abstract class SemesterRepository {
  Future<SemesterList> getSemesters({int? page});
}
