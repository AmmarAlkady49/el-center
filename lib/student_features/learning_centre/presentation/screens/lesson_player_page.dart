import 'package:e_learning_app/core/data/models/course_info_model.dart';
import 'package:e_learning_app/core/data/models/lesson_module.dart';
import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/student_features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:e_learning_app/student_features/learning_centre/presentation/widgets/build_tap_bar_lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/learning_centre_state.dart';
import '../widgets/build_content_player.dart';

class LessonPlayerPage extends StatefulWidget {
  final CourseInfoModel courseInfo;
  final List<CourseModuleModel> courseModules;
  final List<LessonModule> lessons;
  final List<CourseModulesWithLessons> modulesWithLessons;
  final List<CourseReviewModel> courseReview;

  const LessonPlayerPage({
    super.key,
    required this.courseInfo,
    required this.courseModules,
    required this.lessons,
    required this.modulesWithLessons,
    required this.courseReview,
  });

  @override
  State<LessonPlayerPage> createState() => _LessonPlayerPageState();
}

class _LessonPlayerPageState extends State<LessonPlayerPage> {
  late LearningCentreCubit cubit;
  bool isContentLoaded = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<LearningCentreCubit>();
    cubit.getCourseContent(
      courseInfo: widget.courseInfo,
      modulesWithLessons: widget.modulesWithLessons,
      courseReview: widget.courseReview,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(context, title: widget.courseInfo.title!),
      body: BlocConsumer<LearningCentreCubit, LearningCentreState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is SuccessGetCourseContent) {
            isContentLoaded = true;
          } else if (state is FailedGetCourseContent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to load course content: ${state.error}'),
                backgroundColor: AppColors.red,
              ),
            );
          } else if (state is LessonSelected) {
            final currentLesson = cubit.currentLesson;
            if (currentLesson!.contentType == 'video' &&
                currentLesson.content != null) {
              cubit.initializeVideo(currentLesson.content!);
            }
          }
        },
        buildWhen: (previous, current) {
          // Only rebuild for these specific states
          return current is LoadingCourseContent ||
              current is SuccessGetCourseContent ||
              current is FailedGetCourseContent ||
              current is LessonSelected;
        },
        builder: (context, state) {
          if (state is LoadingCourseContent && !isContentLoaded) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is FailedGetCourseContent && !isContentLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load course content',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      cubit.getCourseContent(
                        courseInfo: widget.courseInfo,
                        modulesWithLessons: widget.modulesWithLessons,
                        courseReview: widget.courseReview,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainBlue,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                // Use the new BuildContentPlayer widget
                BuildContentPlayer(lessons: widget.lessons, cubit: cubit),
                Expanded(
                  child: BuildTapBarLesson(cubit: cubit),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
