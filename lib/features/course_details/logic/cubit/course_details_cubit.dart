import 'dart:developer';

import 'package:e_learning_app/features/payment/data/repo/payment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repos/course_details_repo.dart';
import 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo courseDetailsRepo;
  final PaymentRepo paymentRepo;
  CourseDetailsCubit(this.courseDetailsRepo, this.paymentRepo)
      : super(CourseDetailsState.initial());

  List<CourseModuleModel> courseModules = [];
  List<CourseReviewModel> courseReviews = [];
  List<CourseModulesWithLessons> modulesWithLessons = [];
  List<CourseReviewModel> courseReview = [];

  void getCourseDetails(int courseId) async {
    emit(CourseDetailsState.courseDetailsLoading());
    try {
      final isEnrolledResponse = await courseDetailsRepo.isEnrolled(courseId);

      final courseModules =
          await courseDetailsRepo.getAllCourseModules(courseId);

      final courseReviewResult =
          await courseDetailsRepo.getCourseReviews(courseId);
      // List<CourseReviewModel> courseReview = [];

      if (courseReviewResult is Success<List<CourseReviewModel>>) {
        courseReview = courseReviewResult.data;
        courseReviews = courseReview;
      } else {
        courseReview = [];
        courseReviews = [];
      }

      // Fetch lessons for each module
      modulesWithLessons = await Future.wait(
        courseModules.map(
          (module) async {
            final lessonsResult =
                await courseDetailsRepo.getModuleLessons(module.id);

            List<LessonModule> lessons = [];

            if (lessonsResult is Success<List<LessonModule>?>) {
              lessons = lessonsResult.data ?? [];
            } else {
              lessons = [];
            }

            return CourseModulesWithLessons(
                courseModules: module, lessons: lessons);
          },
        ),
      );

      emit(CourseDetailsState.courseDetailsLoaded(
        isEnrolled: isEnrolledResponse,
        courseModules: courseModules,
        modulesWithLessons: modulesWithLessons,
        courseReviews: courseReview,
      ));
      modulesWithLessons = modulesWithLessons;
    } catch (error) {
      emit(
          CourseDetailsState.courseDetailsLoadedError(error: error.toString()));
    }
  }

  // payment
  Future<void> emitPaymentState(int courseID, String paymentMethod) async {
    emit(CourseDetailsState.paymentLoading());

    final result =
        await paymentRepo.createPaymentToken(courseID, paymentMethod);

    if (result is Success<Map<String, String>>) {
      emit(CourseDetailsState.paymentRedirectUrl(result.data['redirectUrl']!));
    } else {
      emit(CourseDetailsState.paymentFailure(error: result.toString()));
    }
  }

  // course review submission
  Future<void> emitCourseReviewState(
      int courseId, String review, int rating) async {
    emit(CourseDetailsState.courseReviewLoading());
    final result =
        await courseDetailsRepo.createCourseReview(courseId, review, rating);
    log(result.toString());
    if (result is Success<String>) {
      emit(CourseDetailsState.courseReviewSuccess(result.data));
    } else {
      emit(CourseDetailsState.courseReviewFailure(error: result.toString()));
    }
  }
}
