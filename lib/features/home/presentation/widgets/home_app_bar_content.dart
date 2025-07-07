import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/helpers/spacing.dart';

class HomeAppBarContent extends StatelessWidget {
  final ProfileAccountModel profileData;
  const HomeAppBarContent({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_image.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 50.h,
          left: 30.w,
          right: 30.w,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: CachedNetworkImageProvider(
                    "https://elcentre-learn.vercel.app/api${profileData.profilePicture}"),
              ),
              horizontalSpacing(20),
              InkWell(
                onTap: () {},
                child: Icon(
                  Iconsax.search_normal_1,
                  size: 25.sp,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              // Text(
              //   "El Center",
              //   style: FontHelper.font16BlackW600(context).copyWith(
              //     color: Colors.white,
              //     fontSize: 20.sp,
              //     letterSpacing: -0.5,
              //   ),
              // ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/el_center_splash_logo.png',
                  width: 150.w,
                  height: 150.h,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
