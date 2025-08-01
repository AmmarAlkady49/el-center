import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_state.dart';

class BuildAppBarForHomePage extends StatelessWidget {
  const BuildAppBarForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is HomeScreenLoading ||
          current is HomeScreenLoaded ||
          current is HomeScreenLoadedError,
      builder: (context, state) {
        return SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 185.h,
          pinned: true,
          // ba: AppColors.mainBlue,
          collapsedHeight: 65.h,
          backgroundColor: AppColors.secondaryBlue,
          elevation: 0,
          title: (state is HomeScreenLoaded)
              ? Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Image.asset(
                        'assets/images/el_center_splash_logo.png',
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10.r),
                      child: Icon(Iconsax.notification5,
                          color: Colors.white, size: 26.sp),
                    ),
                    horizontalSpacing(15),
                    HelperFunctions.showUserImage(
                      state.profileData.profilePicture,
                      50.r,
                      50.w,
                      2.w,
                    ),
                    horizontalSpacing(4),
                  ],
                )
              : null,
          flexibleSpace: FlexibleSpaceBar(
            background: _buildFlexibleContent(state, context),
          ),
        );
      },
    );
  }
}

Widget _buildFlexibleContent(HomeState state, BuildContext context) {
  if (state is HomeScreenLoading) {
    return Center(child: CircularProgressIndicator(color: Colors.white));
  } else if (state is HomeScreenLoaded) {
    final profileData = state.profileData;
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_image.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: Localizations.localeOf(context).languageCode == 'en'
              ? 17.w
              : null,
          right: Localizations.localeOf(context).languageCode == 'ar'
              ? 17.w
              : null,
          bottom: 20.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _getTimeBasedGreeting(context),
                    style: FontHelper.font15BlackW400(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  horizontalSpacing(8),
                  Text(
                    _getGreetingEmoji(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
              verticalSpacing(5),
              Text(
                "${profileData.firstName} ${profileData.lastName}",
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: Colors.white,
                  fontSize: 20.sp,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              verticalSpacing(2),
              // Motivational text
              Text(
                S.of(context).discover_your_learning,
                style: FontHelper.font15BlackW400(context).copyWith(
                  color: Colors.white70,
                  fontSize: 16.sp,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } else if (state is HomeScreenLoadedError) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text(state.error, style: TextStyle(color: Colors.white))),
    );
  } else {
    return SizedBox.shrink();
  }
}

String _getTimeBasedGreeting(BuildContext context) {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return S.of(context).good_morning;
  } else if (hour < 17) {
    return S.of(context).good_afternoon;
  } else {
    return S.of(context).good_evening;
  }
}

String _getGreetingEmoji() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return "☀️";
  } else if (hour < 17) {
    return "🌤️";
  } else {
    return "🌙";
  }
}
