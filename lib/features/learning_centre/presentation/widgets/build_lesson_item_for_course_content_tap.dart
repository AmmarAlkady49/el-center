import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_cubit.dart';

class BuildLessonItemForCourseContentTap extends StatelessWidget {
  final LessonModule lesson;
  final int moduleIndex;
  final int lessonIndex;
  final bool isLast;
  final LearningCentreCubit cubit;
  const BuildLessonItemForCourseContentTap({
    super.key,
    required this.lesson,
    required this.moduleIndex,
    required this.lessonIndex,
    required this.isLast,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = cubit.completedLessonIds.contains(lesson.id);
    final isSelected = cubit.selectedLessonIndex == lessonIndex &&
        cubit.selectedmoduleIndex == moduleIndex;
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainBlue.withAlpha(20) : Colors.white,
        borderRadius: isLast
            ? BorderRadius.vertical(bottom: Radius.circular(16.r))
            : null,
      ),
      child: InkWell(
        onTap: () {
          cubit.selectLesson(
            lessonIndex: lessonIndex,
            selectedmoduleIndex: moduleIndex,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              // Completion Checkbox
              GestureDetector(
                onTap: () {
                  cubit.completeLesson(lesson.id);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: isCompleted ? AppColors.mainBlue : Colors.white,
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.mainBlue
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      if (isCompleted)
                        BoxShadow(
                          color: AppColors.mainBlue.withAlpha(50),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                    ],
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check_rounded,
                          size: 14.sp,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              horizontalSpacing(16),

              // Lesson Number
              Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppColors.mainBlue
                      : AppColors.mainBlue.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${lessonIndex + 1}',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: isCompleted ? Colors.white : AppColors.mainBlue,
                    ),
                  ),
                ),
              ),
              horizontalSpacing(16),

              // Lesson Title and Duration
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title ?? 'Lesson ${lessonIndex + 1}',
                      style: FontHelper.font15BlackW600(context).copyWith(
                        fontSize: 14.sp,
                        decoration:
                            isCompleted ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.grey.shade500,
                        color: isCompleted
                            ? Colors.grey.shade600
                            : AppColors.darkBlue,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(6),
                    Row(
                      children: [
                        Icon(
                          Iconsax.clock,
                          size: 12.sp,
                          color: Colors.grey.shade500,
                        ),
                        horizontalSpacing(4),
                        Text(
                          HelperFunctions.getLessonDuration(lesson),
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: Colors.grey.shade600,
                            fontSize: 11.sp,
                          ),
                        ),
                        horizontalSpacing(12),
                        Icon(
                          HelperFunctions.getContentTypeIcon(
                              lesson.contentType),
                          size: 15.sp,
                          color: Colors.grey.shade500,
                        ),
                        horizontalSpacing(4),
                        Text(
                          lesson.contentType == "video"
                              ? S.of(context).video
                              : lesson.contentType == "audio"
                                  ? S.of(context).audio
                                  : S.of(context).text,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: Colors.grey.shade600,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Play icon
              if (isSelected)
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

}
