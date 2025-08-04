import 'package:e_learning_app/core/data/models/course_module_model.dart';
import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildCurriculumTab extends StatefulWidget {
  final List<CourseModuleModel> courseModules;
  final List<CourseModulesWithLessons> modulesWithLessons;

  const BuildCurriculumTab({
    super.key,
    required this.courseModules,
    required this.modulesWithLessons,
  });

  @override
  State<BuildCurriculumTab> createState() => _BuildCurriculumTabState();
}

class _BuildCurriculumTabState extends State<BuildCurriculumTab> {
  // Track which modules are expanded
  Set<int> expandedModules = {};

  void toggleModuleExpanded(int moduleIndex) {
    setState(() {
      if (expandedModules.contains(moduleIndex)) {
        expandedModules.remove(moduleIndex);
      } else {
        expandedModules.add(moduleIndex);
      }
    });
  }

  // Helper method to get content type icon
  IconData _getContentTypeIcon(String? contentType) {
    switch (contentType?.toLowerCase()) {
      case 'video':
        return Iconsax.video_play;
      case 'audio':
        return Iconsax.music_play;
      case 'text':
        return Iconsax.document_text;
      default:
        return Iconsax.play_circle;
    }
  }

  Widget _buildModuleCard(
      CourseModulesWithLessons moduleWithLessons, int moduleIndex) {
    final module = moduleWithLessons.courseModules;
    final lessons = moduleWithLessons.lessons;
    final isExpanded = expandedModules.contains(moduleIndex);

    // Calculate total duration for this module
    final totalDuration = HelperFunctions.calculateSectionDuration(lessons);

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16.r),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Module Header
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(24.r)),
            onTap: () => toggleModuleExpanded(moduleIndex),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Module number circle
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainBlue.withAlpha(30),
                    ),
                    child: Center(
                      child: Text(
                        '${moduleIndex + 1}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainBlue,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpacing(12),

                  // Module Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module.title ?? 'Module ${moduleIndex + 1}',
                          style: FontHelper.font15BlackW600(context).copyWith(
                            color: AppColors.darkBlue,
                            fontSize: 15.sp,
                          ),
                        ),
                        verticalSpacing(8),
                        Row(
                          children: [
                            _buildPill(
                              icon: Iconsax.video_play,
                              text:
                                  '${lessons.length} ${lessons.length == 1 ? S.of(context).lesson : S.of(context).lessons}',
                              color: AppColors.mainBlue,
                            ),
                            if (totalDuration.isNotEmpty) ...[
                              horizontalSpacing(8),
                              _buildPill(
                                icon: Iconsax.clock,
                                text: totalDuration,
                                color: AppColors.greyBlue,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Expand/Collapse Icon
                  Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainBlue.withAlpha(30),
                    ),
                    child: Center(
                      child: AnimatedRotation(
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
                    child: _buildLessonsForModule(lessons, moduleIndex),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsForModule(List lessons, int moduleIndex) {
    if (lessons.isEmpty) {
      return Container(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Icon(
              Iconsax.info_circle,
              size: 20.sp,
              color: AppColors.greyBlue,
            ),
            horizontalSpacing(12),
            Expanded(
              child: Text(
                S.of(context).no_lessons_available_for_this_module,
                style: FontHelper.font12lackW400(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: lessons.asMap().entries.map<Widget>((entry) {
        final lessonIndex = entry.key;
        final lesson = entry.value;
        final isLast = lessonIndex == lessons.length - 1;

        return _buildLessonItem(lesson, moduleIndex, lessonIndex, isLast);
      }).toList(),
    );
  }

  Widget _buildLessonItem(
      dynamic lesson, int moduleIndex, int lessonIndex, bool isLast) {
    final duration = HelperFunctions.formatDuration(lesson.durationInMinutes);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: !isLast
            ? Border(
                bottom: BorderSide(
                  color: AppColors.grey.withAlpha(200),
                  width: 0.5,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          // Content type icon
          Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyBlue.withAlpha(30),
            ),
            child: Center(
              child: Icon(
                _getContentTypeIcon(lesson.contentType),
                size: 14.sp,
                color: AppColors.greyBlue,
              ),
            ),
          ),
          horizontalSpacing(10),

          // Lesson number
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.darkBlue.withAlpha(20),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              '${moduleIndex + 1}.${lessonIndex + 1}',
              style: FontHelper.font15BlackW600(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
              ),
            ),
          ),
          horizontalSpacing(10),

          // Lesson title
          Expanded(
            child: Text(
              lesson.title ?? 'No title available',
              style: FontHelper.font14BlackW500(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 14.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Duration
          if (duration.isNotEmpty) ...[
            horizontalSpacing(8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.greyBlue.withAlpha(20),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Iconsax.clock,
                    size: 12.sp,
                    color: AppColors.greyBlue,
                  ),
                  horizontalSpacing(4),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  Widget _buildHeader() {
    final totalLessons = widget.modulesWithLessons
        .fold<int>(0, (sum, module) => sum + module.lessons.length);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${S.of(context).course} ${S.of(context).curriculum}",
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          verticalSpacing(8),
          Text(
            widget.courseModules.isEmpty
                ? 'No Curriculum available.'
                : '${widget.courseModules.length} ${S.of(context).modules} • $totalLessons ${S.of(context).lessons}',
            style: FontHelper.font12lackW400(context).copyWith(
              fontSize: 14.sp,
              letterSpacing: -0.2,
              color: AppColors.greyBlue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        _buildHeader(),

        // Modules List
        Expanded(
          child: widget.modulesWithLessons.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.folder_minus,
                        size: 64.sp,
                        color: AppColors.greyBlue.withAlpha(100),
                      ),
                      verticalSpacing(16),
                      Text(
                        'No curriculum available',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyBlue,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.modulesWithLessons.length,
                  separatorBuilder: (context, index) => verticalSpacing(12),
                  itemBuilder: (context, index) {
                    return _buildModuleCard(
                        widget.modulesWithLessons[index], index);
                  },
                ),
        ),
      ],
    );
  }
}
