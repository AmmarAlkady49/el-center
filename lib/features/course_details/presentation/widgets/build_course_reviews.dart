import 'dart:developer';

import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_small_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/updata_course_review_request_body.dart';
import '../../logic/cubit/course_details_state.dart';

class BuildCourseReviews extends StatelessWidget {
  final List<CourseReviewModel> courseReview;
  final bool isEnrolled;
  final CourseInfoModel courseBasicInfo;
  final CourseDetailsCubit cubit;

  const BuildCourseReviews(
      {super.key,
      required this.courseReview,
      required this.isEnrolled,
      required this.courseBasicInfo,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    // Future<void> showUpdateCourseReviewBottomSheet({
    //   required BuildContext context,
    //   required String title,
    //   required String buttonText,
    //   required TextEditingController textEditingController,
    //   required Function(String) onPressed,
    // }) {
    //   return showModalBottomSheet(
    //     context: context,
    //     isScrollControlled: true,
    //     backgroundColor: Colors.transparent,
    //     builder: (BuildContext context) {
    //       return UpdateCourseReviewContent(
    //         title: title,
    //         buttonText: buttonText,
    //         textEditingController: textEditingController,
    //         onPressed: onPressed,
    //       );
    //     },
    //   );
    // }

    log("$isEnrolled is enrolled");
    if (courseReview.isEmpty) {
      return _buildEmptyState(context, isEnrolled: isEnrolled);
    }

    return BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is CourseReviewSuccess ||
          current is CourseReviewFailure ||
          current is CourseReviewLoading ||
          current is UpdateCourseReviewSuccess ||
          current is UpdateCourseReviewFailure,
      listenWhen: (previous, current) =>
          current is CourseReviewSuccess ||
          current is UpdateCourseReviewSuccess ||
          current is UpdateCourseReviewFailure,
      listener: (context, state) {
        if (state is UpdateCourseReviewSuccess) {
          cubit.getCourseDetails(courseBasicInfo.id);
          return HelperDialogs.showSuccess(state.message, context);
        }
        if (state is UpdateCourseReviewFailure) {
          return HelperDialogs.showError(state.error, context);
        }
      },
      builder: (context, state) {
        if (state is CourseReviewLoading ||
            state is UpdateCourseReviewSuccess) {
          return const Center(child: CupertinoActivityIndicator());
        }
        return Column(
          children: [
            _buildReviewsHeader(context, isEnrolled: isEnrolled),
            verticalSpacing(16),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: courseReview.length,
                separatorBuilder: (context, index) => verticalSpacing(16),
                itemBuilder: (context, index) {
                  return _buildReviewCard(context, courseReview[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReviewsHeader(BuildContext context, {required bool isEnrolled}) {
    final totalReviews = courseReview.length;
    final averageRating = courseReview.isNotEmpty
        ? courseReview.map((r) => r.rating).reduce((a, b) => a + b) /
            courseReview.length
        : 0.0;

    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withAlpha(100)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: AppColors.mainBlue,
                size: 24.sp,
              ),
              horizontalSpacing(8),
              Text(
                averageRating.toStringAsFixed(1),
                style: FontHelper.font20BlackW700(context).copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              horizontalSpacing(8),
              Text(
                '($totalReviews ${totalReviews == 1 ? S.of(context).review : S.of(context).reviews})',
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: AppColors.greyBlue,
                ),
              ),
              const Spacer(),
              _buildRatingStars(averageRating),
            ],
          ),
          verticalSpacing(16),
          isEnrolled
              ? _buildWriteReviewButton(context, () {
                  context.pushNamed(AppRoutes.writeReview, arguments: {
                    'courseBasicInfo': courseBasicInfo,
                    'courseDetailsCubit': cubit,
                  });
                })
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        final starValue = index + 1;
        return Icon(
          starValue <= rating
              ? Icons.star_rounded
              : starValue - 0.5 <= rating
                  ? Icons.star_half_rounded
                  : Icons.star_outline_rounded,
          color: AppColors.mainBlue,
          size: 16.sp,
        );
      }),
    );
  }

  Widget _buildReviewCard(BuildContext context, CourseReviewModel review) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withAlpha(100)),
        boxShadow: [
          BoxShadow(
            // color: AppColors.darkGreyBlue.withAlpha(50),
            color: Colors.black12,
            blurRadius: 2.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserAvatar(review),
              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.studentName,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    verticalSpacing(4),
                    Row(
                      children: [
                        _buildStarRating(review.rating),
                        horizontalSpacing(8),
                        Text(
                          HelperFunctions.formatDate(review.createdAt),
                          style: FontHelper.font12lackW400(context).copyWith(
                            color: AppColors.greyBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (review.studentId == cubit.userId) ...[
                BuildSmallActionButton(
                  onTap: () {
                    HelperDialogs.updateCourseReviewBottomSheet(
                      context: context,
                      title: S.of(context).edit_review,
                      initialValue: review.reviewContent,
                      initalRating: review.rating,
                      buttonText: S.of(context).update,
                      onPressed: (newReview, newRating) {
                        cubit.updateCourseReview(
                          UpdateCourseReviewRequestBody(
                            id: review.id,
                            rating: newRating,
                            reviewContent: newReview,
                          ),
                        );
                      },
                    );
                  },
                  color: AppColors.greyBlue,
                  icon: Iconsax.edit,
                ),
                horizontalSpacing(5),
                BuildSmallActionButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => HelperDialogs.showReportOrDeleteDialog(
                          context: context,
                          onPressed: () {
                            cubit.deleteCourseReview(review.id);
                            Navigator.of(context).pop();
                          },
                          title: S.of(context).delete_review,
                          message: S.of(context).delete_description,
                          buttonText: S.of(context).delete,
                        ),
                      );
                    },
                    color: AppColors.red,
                    icon: CupertinoIcons.delete),
              ]
            ],
          ),
          verticalSpacing(12),
          Text(
            review.reviewContent,
            style: FontHelper.font14BlackW500(context).copyWith(
              height: 1.6,
              color: AppColors.darkGreyBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(CourseReviewModel review) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: AppColors.mainBlue.withAlpha(50),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.mainBlue.withAlpha(100)),
      ),
      child: review.studentImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                "${ApiConstants.baseUrlOfTheImage}${review.studentImage!}",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildFallbackAvatar(review.studentName);
                },
              ),
            )
          : _buildFallbackAvatar(review.studentName),
    );
  }

  Widget _buildFallbackAvatar(String name) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'U',
        style: TextStyle(
          color: AppColors.mainBlue,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
          color: AppColors.mainBlue,
          size: 16.sp,
        );
      }),
    );
  }

  Widget _buildEmptyState(BuildContext context, {required bool isEnrolled}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(50),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              Icons.rate_review_outlined,
              size: 48.sp,
              color: AppColors.mainBlue,
            ),
          ),
          verticalSpacing(16),
          Text(
            S.of(context).no_reviews_yet,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
            ),
          ),
          verticalSpacing(8),
          Text(
            S.of(context).be_the_first_one_to_review,
            textAlign: TextAlign.center,
            style: FontHelper.font14BlackW500(context).copyWith(
              height: 1.5,
              color: AppColors.greyBlue,
            ),
          ),
          verticalSpacing(24),
          isEnrolled
              ? _buildWriteReviewButton(context, () {
                  context.pushNamed(AppRoutes.writeReview, arguments: {
                    'courseBasicInfo': courseBasicInfo,
                    'courseDetailsCubit': cubit,
                  });
                })
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

Widget _buildWriteReviewButton(
    BuildContext context, VoidCallback onWriteReview) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: onWriteReview,
      icon: Icon(
        Icons.edit_outlined,
        color: AppColors.backgroundWiteColor,
        size: 18.sp,
      ),
      label: Text(
        S.of(context).write_a_review,
        style: FontHelper.font14BlackW500(context).copyWith(
          color: AppColors.backgroundWiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainBlue,
        foregroundColor: AppColors.backgroundWiteColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
  );
}
