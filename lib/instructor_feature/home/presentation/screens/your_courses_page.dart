import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:e_learning_app/instructor_feature/home/presentation/widgets/your_course_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/course_info_model_with_student_count_and_completion_rate_model.dart';

class YourCoursesPage extends StatelessWidget {
  final List<CourseInfoModelWithStudentCountAndCompletionRateModel> courses;
  final HomeInstructorCubit cubit;
  const YourCoursesPage(
      {super.key, required this.courses, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(context, title: S.of(context).your_courses),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section with stats
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: AppColors.backgroundWiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: AppColors.grey.withAlpha(60),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).your_courses,
                            style: FontHelper.font20BlackW700(context).copyWith(
                              color: AppColors.darkBlue,
                              fontSize: 22.sp,
                            ),
                          ),
                          verticalSpacing(6),
                          Text(
                            '${courses.length} ${courses.length == 1 ? 'course' : 'courses'} created',
                            style: FontHelper.font14BlackW500(context).copyWith(
                              color: AppColors.greyBlue,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.mainBlue,
                            AppColors.mainBlue.withAlpha(200),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mainBlue.withAlpha(100),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Iconsax.book_1,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              // Courses list
              courses.isEmpty
                  ? _buildEmptyState(context)
                  : Column(
                      children: List.generate(
                        courses.length,
                        (index) {
                          final course = courses[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: YourCourseItemCard(
                              course: course,
                              cubit: cubit,
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.w),
      margin: EdgeInsets.symmetric(vertical: 60.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: AppColors.grey.withAlpha(60),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.mainBlue.withAlpha(50),
                    AppColors.mainBlue.withAlpha(30),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.book_1,
                size: 48.sp,
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpacing(24),
            Text(
              'No courses yet',
              style: FontHelper.font20BlackW700(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 20.sp,
              ),
            ),
            verticalSpacing(8),
            Text(
              'Start creating your first course to see it here',
              style: FontHelper.font14BlackW500(context).copyWith(
                color: AppColors.greyBlue,
                fontSize: 14.sp,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
