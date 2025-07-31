import 'dart:developer';

import 'package:e_learning_app/core/data/models/course_info_model.dart';
import 'package:e_learning_app/features/my_courses/logic/cubit/my_courses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/student_enrollments_model.dart';
import '../../data/repo/my_courses_repo.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo myCoursesRepo;
  MyCoursesCubit({required this.myCoursesRepo})
      : super(MyCoursesState.initial());

  late List<CourseInfoModel> studentEnrollmentsCoursesInfo;

  void loadStudentEnrollments() async {
    emit(MyCoursesState.myCoursesLoading());

    try {
      final List<StudentEnrollmentsModel> enrollments =
          await myCoursesRepo.getStudentEnrollments();

      log("Student Enrollments: ${enrollments.length}");

      final allCoursesInfo =
          await myCoursesRepo.getStudentEnrollmentsCoursesInfo();

      log("All Courses Info: ${allCoursesInfo.data.length}");
      studentEnrollmentsCoursesInfo = allCoursesInfo.data
          .where(
            (element) => enrollments.any((e) => e.courseId == element.id),
          )
          .toList();
      log("Filtered Courses Info: ${studentEnrollmentsCoursesInfo.length}");

      emit(MyCoursesState.myCoursesLoaded(
        studentEnrollments: studentEnrollmentsCoursesInfo,
        studentEnrollmentsCoursesInfo: enrollments,
      ));
    } catch (e) {
      emit(MyCoursesState.myCoursesLoadedError(errorMessage: e.toString()));
    }
  }
}
