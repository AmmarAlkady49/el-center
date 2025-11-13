
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

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
        _buildAppBarIcons(Icons.share, () async {
          final String webCourseLink =
              "https://elcentre-learn.vercel.app/courses/${courseBasicInfo.id}";

          await SharePlus.instance.share(
            ShareParams(
              text:
                  "I’m currently taking ${courseBasicInfo.title} on El Centre 📚 \nIt’s taught by ${courseBasicInfo.instructorName} and covers ${courseBasicInfo.categoryName} in an easy and practical way. \nCheck out the course here 👉 $webCourseLink \nOr download the app and join me 👉 [App Link]",
              title: 'Let’s Learn Together 🎉',
              // files: [XFile(path)],
              sharePositionOrigin: const Rect.fromLTWH(0, 0, 0, 0),
            ),
          );
        }),
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
