import 'dart:developer';

import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

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
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(),
          verticalSpacing(16),
          Text(
            S.of(context).loading_quizzes,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          verticalSpacing(8),
          Text(
            "Please wait while we load your quizzes...",
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.red.withAlpha(50),
                  AppColors.red.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(
              Iconsax.warning_2,
              size: 48.sp,
              color: AppColors.red,
            ),
          ),
          verticalSpacing(16),
          Text(
            S.of(context).failed_to_load_quizzes,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(8),
          Text(
            error,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(20),
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.red,
                  AppColors.red.withAlpha(190),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.red.withAlpha(90),
                  offset: Offset(0, 4.h),
                  blurRadius: 8.r,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  cubit.getAllCourseQuizzes(cubit.conurseInfo!.id);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.refresh,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      horizontalSpacing(8),
                      Text(
                        "Try Again",
                        style: FontHelper.font16WhiteW600(context).copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.grey.withAlpha(70),
                    AppColors.grey.withAlpha(50),
                  ],
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Iconsax.clipboard_close,
                size: 48.sp,
                color: AppColors.greyBlue,
              ),
            ),
            verticalSpacing(16),
            Text(
              S.of(context).no_quizzes_available,
              style: FontHelper.font20BlackW700(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(8),
            Text(
              S.of(context).complete_lessons_to_unlock_quizzes,
              style: FontHelper.font14BlackW500(context).copyWith(
                color: AppColors.greyBlue,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizAvailableState(List<QuizModel> quizzes) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainBlue.withAlpha(50),
                  AppColors.mainBlue.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(
              Iconsax.clipboard_tick,
              size: 48.sp,
              color: AppColors.mainBlue,
            ),
          ),
          verticalSpacing(16),
          Text(
            S.of(context).quiz_ready,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          verticalSpacing(8),
          Text(
            S.of(context).there_is_quiz_for_this_lesson,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(20),
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.mainBlue,
                  AppColors.mainBlue.withAlpha(190),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(90),
                  offset: Offset(0, 4.h),
                  blurRadius: 8.r,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.lessonQuiz,
                    arguments: quizzes,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.play,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      horizontalSpacing(8),
                      Text(
                        S.of(context).start_quiz,
                        style: FontHelper.font16WhiteW600(context).copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
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
