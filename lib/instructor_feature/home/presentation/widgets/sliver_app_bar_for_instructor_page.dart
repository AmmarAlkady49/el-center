import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class SliverAppBarForInstructorPage extends StatefulWidget {
  final ProfileAccountModel instructorProfile;

  const SliverAppBarForInstructorPage({
    super.key,
    required this.instructorProfile,
  });

  @override
  State<SliverAppBarForInstructorPage> createState() =>
      _SliverAppBarForInstructorPageState();
}

class _SliverAppBarForInstructorPageState
    extends State<SliverAppBarForInstructorPage> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 140.h,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: MediaQuery.of(context).padding.top + 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HelperFunctions.showUserImage(
                    widget.instructorProfile.profilePicture,
                    48.sp,
                    48.sp,
                    2,
                  ),
                  horizontalSpacing(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${S.of(context).hi}, ${widget.instructorProfile.firstName}! 👋',
                          style: FontHelper.font16BlackW600(context).copyWith(
                            color: Colors.grey[800],
                            fontSize: 17.sp,
                          ),
                        ),
                        verticalSpacing(2),
                        Text(
                          S.of(context).ready_to_inspire,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: Colors.grey[600],
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSearchButton(),
                  horizontalSpacing(8),
                  _buildNotificationButton(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: TabBar(
            tabAlignment: TabAlignment.fill,
            indicator: BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.greyBlue,
            labelStyle: FontHelper.font15BlackW600(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: FontHelper.font12lackW400(context).copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: const [
              Tab(text: '📚 My Courses'),
              Tab(text: '⚡ Recent Activity'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return GestureDetector(
      onTap: _onSearchTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.blue.withAlpha(30),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Colors.blue.withAlpha(90),
            width: 1,
          ),
        ),
        child: Icon(
          Iconsax.search_normal_1,
          color: Colors.blue,
          size: 20.sp,
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: _onNotificationTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.orange.withAlpha(30),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Colors.orange.withAlpha(90),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                Iconsax.notification,
                color: Colors.orange[700],
                size: 20.sp,
              ),
            ),
            Positioned(
              right: 8.w,
              top: 7.h,
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchTap() {
    // Handle search button tap
  }

  void _onNotificationTap() {
    // Handle notification button tap
  }
}
