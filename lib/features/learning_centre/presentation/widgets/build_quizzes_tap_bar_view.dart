import 'dart:developer';

import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/quiz_model.dart';
import 'build_quiz_header_for_quizzes_tap.dart';

class BuildQuizzesTapBarView extends StatefulWidget {
  const BuildQuizzesTapBarView({super.key});

  @override
  State<BuildQuizzesTapBarView> createState() => _BuildQuizzesTapBarViewState();
}

class _BuildQuizzesTapBarViewState extends State<BuildQuizzesTapBarView> {
  late LearningCentreCubit cubit;
  late PageController _pageController;
  int currentQuizIndex = 0;
  Map<int, String> selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    cubit = context.read<LearningCentreCubit>();
    _pageController = PageController();
    if (cubit.quizzes == null) {
      cubit.getAllCourseQuizzes(cubit.conurseInfo!.id);
    } else {
      cubit.getQuizForSelectedLesson(cubit.selectedLessonIndex);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildQuizHeaderForQuizzesTap(),
            verticalSpacing(20.h),
            BlocBuilder<LearningCentreCubit, LearningCentreState>(
              bloc: cubit,
              buildWhen: (previous, current) =>
                  current is GettingQuizzesByCourse ||
                  current is SuccessGettingQuizzesByCourse ||
                  current is FaieldGettingQuizzedByCourse,
              builder: (context, state) {
                if (state is GettingQuizzesByCourse) {
                  return _buildLoadingState();
                } else if (state is SuccessGettingQuizzesByCourse) {
                  return _buildQuizzesContent(cubit);
                } else if (state is FaieldGettingQuizzedByCourse) {
                  return _buildErrorState(state.error);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(175),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CupertinoActivityIndicator(
              color: Colors.white,
              radius: 14.sp,
            ),
          ),
          verticalSpacing(16),
          Text(
            S.of(context).loading_quizzes,
            style: FontHelper.font15BlackW600(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.red,
            AppColors.red.withAlpha(200),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.red.withAlpha(100),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(60),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          verticalSpacing(12),
          Text(
            S.of(context).failed_to_load_quizzes,
            style: FontHelper.font16BlackW600(context).copyWith(
              color: Colors.white,
              fontSize: 15.sp,
              wordSpacing: -1,
            ),
          ),
          verticalSpacing(8),
          Text(
            error,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: Colors.white70,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue,
            AppColors.mainBlue.withAlpha(200),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(100),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(60),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.quiz_outlined,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          verticalSpacing(16.h),
          Text(
            S.of(context).no_quizzes_available,
            style: FontHelper.font16BlackW600(context).copyWith(
              color: Colors.white,
              fontSize: 15.sp,
              wordSpacing: -1,
            ),
          ),
          verticalSpacing(8.h),
          Text(
            S.of(context).complete_lessons_to_unlock_quizzes,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: Colors.white70,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuizAvailableState(List<QuizModel> quizzes) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue,
            AppColors.mainBlue.withAlpha(200),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(100),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(60),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.quiz_rounded,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          verticalSpacing(16.h),
          Text(
            S.of(context).quiz_ready,
            style: FontHelper.font16BlackW600(context).copyWith(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpacing(8.h),
          Text(
            S.of(context).there_is_quiz_for_this_lesson,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: Colors.white70,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(20.h),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.lessonQuiz,
                arguments: quizzes,
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: AppColors.mainBlue,
                    size: 20.sp,
                  ),
                  horizontalSpacing(8),
                  Text(
                    S.of(context).start_quiz,
                    style: FontHelper.font16BlackW600(context).copyWith(
                      color: AppColors.mainBlue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizzesContent(LearningCentreCubit cubit) {
    final selectedLessonQuizzes =
        cubit.getQuizForSelectedLesson(cubit.selectedLessonIndex);
    log("selectedLessonQuizzes: ${selectedLessonQuizzes.length}");
    if (selectedLessonQuizzes.isEmpty) {
      return _buildEmptyState();
    } else {
      return _buildQuizAvailableState(cubit.quizzes!);
    }
  }
}
