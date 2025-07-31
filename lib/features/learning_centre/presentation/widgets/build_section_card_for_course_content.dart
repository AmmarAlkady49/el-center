import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/learning_centre_cubit.dart';
import '../../logic/cubit/learning_centre_state.dart';
import 'build_lesson_item_for_course_content_tap.dart';

class BuildSectionCardForCourseContent extends StatefulWidget {
  final CourseModuleModel module;
  final List<LessonModule> lessons;
  final int moduleIndex;
  final bool isExpanded;
  final LearningCentreCubit cubit;
  const BuildSectionCardForCourseContent({
    super.key,
    required this.module,
    required this.lessons,
    required this.moduleIndex,
    required this.isExpanded,
    required this.cubit,
  });

  @override
  State<BuildSectionCardForCourseContent> createState() =>
      _BuildSectionCardForCourseContentState();
}

class _BuildSectionCardForCourseContentState
    extends State<BuildSectionCardForCourseContent> {
  @override
  Widget build(BuildContext context) {
    final completedCount = widget.lessons
        .where((lesson) => widget.cubit.completedLessonIds.contains(lesson.id))
        .length;
    final progress =
        widget.lessons.isEmpty ? 0 : completedCount / widget.lessons.length;

    final isExpanded =
        widget.cubit.expandedModules.contains(widget.moduleIndex);
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16.r),
      color: Colors.white,
      child: Column(
        children: [
          // Section Header with progress indicator
          InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            onTap: () {
              widget.cubit.toggleModuleExpanded(widget.moduleIndex);
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Progress circle
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child: CircularProgressIndicator(
                          value: 50,
                          strokeWidth: 3,
                          backgroundColor: AppColors.greyBlue.withAlpha(70),
                          color: AppColors.mainBlue,
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainBlue,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpacing(16),

                  // Section Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.moduleIndex + 1}. ${widget.module.title}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        verticalSpacing(8),
                        Row(
                          children: [
                            _buildPill(
                              icon: Iconsax.video_play,
                              text: '$completedCount/${widget.lessons.length}',
                              color: AppColors.mainBlue,
                            ),
                            horizontalSpacing(8),
                            _buildPill(
                              icon: Iconsax.clock,
                              text: HelperFunctions.calculateSectionDuration(
                                  widget.lessons),
                              color: AppColors.greyBlue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Expand/Collapse Icon
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainBlue.withAlpha(30),
                    ),
                    child: Center(
                      child: AnimatedRotation(
                        // turns: widget.isExpanded ? 0.50 : 0,
                        turns: isExpanded ? 0.50 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.mainBlue,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lessons List
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isExpanded ? null : 0,
            child: isExpanded
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16.r)),
                    ),
                    child:
                        BlocBuilder<LearningCentreCubit, LearningCentreState>(
                      builder: (context, state) {
                        return Column(
                          children: widget.lessons.asMap().entries.map((entry) {
                            final lessonIndex = entry.key;
                            final lesson = entry.value;
                            return BuildLessonItemForCourseContentTap(
                              lesson: lesson,
                              moduleIndex: widget.moduleIndex,
                              lessonIndex: lessonIndex,
                              cubit: widget.cubit,
                              isLast: lessonIndex == widget.lessons.length - 1,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildPill({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12.sp,
            color: color,
          ),
          horizontalSpacing(4),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
