import 'package:e_learning_app/core/data/models/lesson_module.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../core/widgets/build_geniric_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/build_text_content_preview.dart';
import '../widgets/build_video_preview_player.dart';

class PreviewLessonPage extends StatefulWidget {
  final CourseDetailsCubit cubit;
  final LessonModule lesson;
  const PreviewLessonPage({
    super.key,
    required this.cubit,
    required this.lesson,
  });

  @override
  State<PreviewLessonPage> createState() => _PreviewLessonPageState();
}

class _PreviewLessonPageState extends State<PreviewLessonPage> {
  @override
  void initState() {
    super.initState();
    if (widget.lesson.contentType == 'video') {
      widget.cubit.initializePreviewLesson(widget.lesson);
    } else {
      widget.cubit.initializeText(widget.lesson);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(context,
          title: widget.lesson.title ?? S.of(context).preview, elevation: 4),
      body: Column(
        children: [
          SizedBox(
            height: 217.h,
            child:
                _buildContentBasedOnType(widget.cubit, widget.lesson, context),
          ),
          verticalSpacing(40),
          _buildInvetationToEnroll(context),
        ],
      ),
    );
  }

  Widget _buildContentBasedOnType(
      CourseDetailsCubit cubit, LessonModule lesson, BuildContext context) {
    if (lesson.contentType == 'video') {
      return BuildVideoPreviewPlayer(cubit: cubit);
    } else if (lesson.contentType == 'text') {
      return BuildTextContentPreview(cubit: cubit, lesson: lesson);
    } else {
      return _buildUnsupportedContent(context);
    }
  }

  Widget _buildUnsupportedContent(BuildContext context) {
    return Container(
      color: AppColors.backgroundWiteColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_outlined,
              size: 48.sp,
              color: AppColors.greyBlue,
            ),
            verticalSpacing(16),
            Text(S.of(context).unsupported_content_type,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: AppColors.greyBlue,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildInvetationToEnroll(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue.withAlpha(20),
            AppColors.mainBlue.withAlpha(50),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.mainBlue.withAlpha(50),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(40),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with modern styling
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.mainBlue.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.school_rounded,
                size: 32.sp,
                color: AppColors.mainBlue,
              ),
            ),

            verticalSpacing(20),

            // Main title with better typography
            Text(
              S.of(context).enjoyed_this_preview,
              style: FontHelper.font16BlackW600(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),

            verticalSpacing(8),

            // Subtitle with improved styling
            Text(
              S.of(context).get_access_to_full_course,
              style: FontHelper.font16BlackW600(context).copyWith(
                color: AppColors.greyBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            verticalSpacing(24),

            // Single action button with modern design
            _buildModernEnrollButton(
              context,
              "Explore More Lessons", // You can also use: "Back to Course", "Continue Learning", "Discover More"
              () {
                Navigator.pop(context);
              },
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernEnrollButton(BuildContext context, String title,
      void Function() onPressed, bool isPrimary) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(90),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.mainBlue : Colors.transparent,
          foregroundColor: isPrimary ? Colors.white : AppColors.mainBlue,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: isPrimary
                ? BorderSide.none
                : BorderSide(
                    color: AppColors.mainBlue.withAlpha(90),
                    width: 1.5,
                  ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isPrimary) ...[
              Icon(
                Icons.credit_card_rounded,
                size: 18.sp,
                color: Colors.white,
              ),
              SizedBox(width: 8.w),
            ],
            Text(
              title,
              style: FontHelper.font20BlackW700(context).copyWith(
                color: isPrimary ? Colors.white : AppColors.mainBlue,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
            if (!isPrimary) ...[
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16.sp,
                color: AppColors.mainBlue,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
