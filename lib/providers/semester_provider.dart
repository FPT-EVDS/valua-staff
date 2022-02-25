import 'package:valua_staff/models/semester_list.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/semester_repository.dart';

class SemesterProvider extends BaseProvider implements SemesterRepository {
  @override
  Future<SemesterList> getSemesters({int? page}) async {
    // Fixed parameter for sorting by begin date
    final response = await get("/semesters", query: {
      "sort": "beginDate,desc",
      "page": page,
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return SemesterList.fromJson(response.body);
  }
}
