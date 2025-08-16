import '../../../../core/data/models/paginated_course_response.dart';
import '../../../../core/networking/api_service.dart';
import '../model/student_enrollments_model.dart';

class MyCoursesRepo {
  final ApiService _apiService;

  MyCoursesRepo(this._apiService);

  Future<List<StudentEnrollmentsModel>> getStudentEnrollments() async {
    try {
      return await _apiService.getStudentEnrollments();
    } catch (e) {
      throw Exception('Failed to fetch student enrollments: $e');
    }
  }

  Future<PaginatedCourseResponse> getStudentEnrollmentsCoursesInfo() async {
    try {
      final response = await _apiService.getAllCourses();
      return response;
    } catch (e) {
      throw Exception('Failed to fetch student enrollments courses info: $e');
    }
  }
}
