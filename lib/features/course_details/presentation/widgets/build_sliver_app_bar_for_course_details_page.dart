import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_colors.dart';

class BuildSliverAppBarForCourseDetailsPage extends StatelessWidget {
  final CourseInfoModel courseBasicInfo;
  const BuildSliverAppBarForCourseDetailsPage(
      {super.key, required this.courseBasicInfo});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260.h,
      pinned: true,
      collapsedHeight: 65.h,
      backgroundColor: AppColors.darkBlue,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            courseBasicInfo.thumbnail != null
                ? Image.network(
                    "${ApiConstants.baseUrlOfTheImage}${courseBasicInfo.thumbnail!}",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholderImage(),
                  )
                : _buildPlaceholderImage(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      leading: _buildAppBarIcons(Icons.arrow_back_ios_new_rounded, () {
        Navigator.pop(context);
      }),
      leadingWidth: 70.w,
      actions: [
        _buildAppBarIcons(Icons.favorite_border, () {}),
        horizontalSpacing(8),
        _buildAppBarIcons(Icons.share, () {}),
        horizontalSpacing(8),
      ],
    );
  }
}

Widget _buildAppBarIcons(IconData icon, void Function() onTap) {
  return IconButton(
    icon: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        icon,
        color: Colors.white,
        size: 26.sp,
      ),
    ),
    onPressed: onTap,
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(6.r)),
      backgroundColor:
          WidgetStateProperty.all<Color>(Colors.black.withAlpha(120)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
          side: const BorderSide(color: Colors.white24),
        ),
      ),
    ),
  );
}

Widget _buildPlaceholderImage() {
  return Container(
    color: AppColors.grey,
    child: Center(
      child: Icon(
        Icons.image,
        size: 130.r,
        color: AppColors.darkGreyBlue,
      ),
    ),
  );
}
