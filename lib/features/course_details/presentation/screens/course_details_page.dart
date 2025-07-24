import 'package:e_learning_app/core/helpers/helper_functions.dart'
    show HelperFunctions;
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_course_details_header.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_price_and_actions.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_sliver_app_bar_for_course_details_page.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_tab_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/course_details_state.dart';

class CourseDetailsPage extends StatelessWidget {
  final CourseInfoModel courseBasicInfo;

  const CourseDetailsPage({super.key, required this.courseBasicInfo});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseDetailsCubit>();
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      body: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        bloc: cubit,
        listenWhen: (previous, current) => current is CourseReviewSuccess,
        listener: (context, state) {
          if (state is CourseReviewSuccess) {
            cubit.getCourseDetails(courseBasicInfo.id);
            return HelperFunctions.showSuccess(
                S.of(context).review_submitted, context);
          }
        },
        buildWhen: (previous, current) =>
            current is CourseDetailsLoading ||
            current is CourseDetailsLoaded ||
            current is CourseDetailsLoadedError ||
            current is PaymentSuccess ||
            current is PaymentFailure,
        builder: (context, state) {
          if (state is CourseDetailsLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is CourseDetailsLoadedError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CourseDetailsLoaded) {
            cubit.courseModules = state.courseModules;
            return CustomScrollView(
              slivers: [
                BuildSliverAppBarForCourseDetailsPage(
                    courseBasicInfo: courseBasicInfo),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildCourseDetailsHeader(
                              courseBasicInfo: courseBasicInfo),
                          verticalSpacing(24),
                          BuildPriceAndActions(
                            courseBasicInfo: courseBasicInfo,
                            cubit: cubit,
                            lessons: state.modulesWithLessons
                                .expand((module) =>
                                    module.lessons)
                                .toList(),
                            isEnrolled: state.isEnrolled,
                          ),
                          verticalSpacing(16),
                          BuildTabSection(
                            courseBasicInfo: courseBasicInfo,
                            courseModules: state.courseModules,
                            modulesWithLessons: state.modulesWithLessons,
                            courseReviews: state.courseReviews,
                            isEnrolled: state.isEnrolled,
                            cubit: cubit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
