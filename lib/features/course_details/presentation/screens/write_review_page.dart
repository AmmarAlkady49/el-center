import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class WriteReviewPage extends StatefulWidget {
  final CourseInfoModel courseBasicInfo;
  final CourseDetailsCubit courseDetailsCubit;

  const WriteReviewPage({
    super.key,
    required this.courseBasicInfo,
    required this.courseDetailsCubit,
  });

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _reviewController = TextEditingController();
  final FocusNode _reviewFocusNode = FocusNode();

  int _selectedRating = 0;
  bool _isSubmitting = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _reviewController.dispose();
    _reviewFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(context, title: S.of(context).write_a_review),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCourseHeader(),
                    verticalSpacing(24),
                    _buildRatingSection(),
                    verticalSpacing(24),
                    _buildReviewTextSection(),
                    verticalSpacing(24),
                    _buildHelpfulTips(),
                  ],
                ),
              ),
            ),
            _buildSubmitButton(
                courseID: widget.courseBasicInfo.id,
                rating: _selectedRating,
                review: _reviewController.text,
                cubit: widget.courseDetailsCubit),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseHeader() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withAlpha(100)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGreyBlue.withAlpha(20),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(50),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: widget.courseBasicInfo.thumbnail != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      "${ApiConstants.baseUrlOfTheImage}${widget.courseBasicInfo.thumbnail}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildFallbackCourseImage();
                      },
                    ),
                  )
                : _buildFallbackCourseImage(),
          ),
          horizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).you_are_reviewing,
                  style: FontHelper.font12lackW400(context).copyWith(
                    color: AppColors.greyBlue,
                  ),
                ),
                verticalSpacing(4),
                Text(
                  widget.courseBasicInfo.title ?? 'Course Title',
                  style: FontHelper.font15BlackW600(context).copyWith(
                    color: AppColors.darkBlue,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackCourseImage() {
    return Center(
      child: Icon(
        Icons.play_circle_outline,
        color: AppColors.mainBlue,
        size: 24.sp,
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).how_would_you_rate_this_course,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        verticalSpacing(8),
        Text(
          S.of(context).tap_the_stars_to_rate_your_experience,
          style: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.greyBlue,
          ),
        ),
        verticalSpacing(16),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Icon(
                    index < _selectedRating
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: index < _selectedRating
                        ? AppColors.mainBlue
                        : AppColors.grey,
                    size: 40.sp,
                  ),
                ),
              );
            }),
          ),
        ),
        if (_selectedRating > 0) ...[
          verticalSpacing(12),
          Center(
            child: Text(
              _getRatingText(_selectedRating, context),
              style: FontHelper.font15BlackW600(context).copyWith(
                color: AppColors.mainBlue,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildReviewTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).share_your_thoughts,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        verticalSpacing(8),
        Text(
          S.of(context).tell_others_about_your_experience_with_this_course,
          style: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.greyBlue,
          ),
        ),
        verticalSpacing(16),
        TextField(
          controller: _reviewController,
          focusNode: _reviewFocusNode,
          maxLines: 6,
          maxLength: 500,
          decoration: InputDecoration(
            hintText: S.of(context).write_your_review_here,
            hintStyle: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue.withAlpha(150),
              height: 1.5,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.mainBlue.withAlpha(175),
                width: 2.w,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.grey.withAlpha(100),
              ),
            ),
            contentPadding: EdgeInsets.all(16.w),
            counterStyle: FontHelper.font12lackW400(context).copyWith(
              color: AppColors.greyBlue,
            ),
          ),
          style: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.darkGreyBlue,
            height: 1.5,
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _buildHelpfulTips() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.mainBlue.withAlpha(20),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.mainBlue.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: AppColors.mainBlue,
                size: 20.sp,
              ),
              horizontalSpacing(8),
              Text(
                S.of(context).tips_for_a_helpful_review,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          verticalSpacing(8),
          Text(
            '${S.of(context).be_specific}\n'
            '${S.of(context).mention_the_course_content}\n'
            '${S.of(context).help_others_understand}\n'
            "${S.of(context).keep_it_constructive}",
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.darkGreyBlue,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(
      {required int courseID,
      required int rating,
      required String review,
      required CourseDetailsCubit cubit}) {
    final isFormValid =
        _selectedRating > 0 && _reviewController.text.trim().isNotEmpty;

    return Container(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 28.h, top: 16.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        border: Border(
          top: BorderSide(color: AppColors.grey.withAlpha(100)),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isFormValid && !_isSubmitting
              ? () => _submitReview(
                  courseID: courseID,
                  rating: rating,
                  review: review,
                  cubit: cubit)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isFormValid ? AppColors.mainBlue : AppColors.grey,
            foregroundColor: AppColors.backgroundWiteColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: _isSubmitting
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: CupertinoActivityIndicator(
                    color: AppColors.backgroundWiteColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send_outlined,
                      size: 20.sp,
                    ),
                    horizontalSpacing(8),
                    Text(
                      S.of(context).submit_review,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.backgroundWiteColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  String _getRatingText(int rating, BuildContext context) {
    switch (rating) {
      case 1:
        return S.of(context).poor;
      case 2:
        return S.of(context).fair;
      case 3:
        return S.of(context).good;
      case 4:
        return S.of(context).very_good;
      case 5:
        return S.of(context).excellent;
      default:
        return '';
    }
  }

  Future<void> _submitReview(
      {required int courseID,
      required String review,
      required int rating,
      required CourseDetailsCubit cubit}) async {
    if (_selectedRating == 0 || _reviewController.text.trim().isEmpty) {
      return HelperDialogs.showError(
          S.of(context).please_provide_a_rating, context);
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      cubit.emitCourseReviewState(courseID, review, rating);

      Navigator.of(context).pop(true);

      
    } catch (e) {
      return HelperDialogs.showError(S.of(context).failed_to_submit, context);
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }
}
