import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/data/models/update_profile_model.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:e_learning_app/features/settings/presentation/widgets/build_user_info_from_for_user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/build_geniric_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/settings_state.dart';

class PersonalInfoScreen extends StatelessWidget {
  final ProfileAccountModel profileInfo;
  final SettingsCubit cubit;
  const PersonalInfoScreen(
      {super.key, required this.profileInfo, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWiteColor,
        appBar: buildGenericAppBar(
          context,
          title: S.of(context).personal_information,
          elevation: 8,
          backgroundColor: AppColors.mainBlue,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpacing(20),
              _buildProfileSection(context),
              verticalSpacing(6),
              Text(
                cubit.emailController.text,
                style: FontHelper.font16WhiteW600(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacing(18),
              BuildUserInfoFromForUserInfoPage(
                profileInfo: profileInfo,
                cubit: cubit,
              ),
              verticalSpacing(16),
              _buildSaveButton(context, cubit),
              verticalSpacing(10),
            ],
          ),
        ));
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildEnhancedAvatar(profileInfo.profilePicture),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: AppColors.mainBlue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3.w,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEnhancedAvatar(String? imageUrl) {
    return Container(
      width: 110.w,
      height: 110.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainBlue,
        border: Border.all(
          color: Colors.white,
          width: 4.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: imageUrl == null
            ? Icon(
                Icons.person,
                size: 50.sp,
                color: Colors.white,
              )
            : CachedNetworkImage(
                imageUrl: "${ApiConstants.baseUrlOfTheImage}/$imageUrl",
                fit: BoxFit.cover,
                placeholder: (context, url) => Icon(
                  Icons.person,
                  size: 50.sp,
                  color: Colors.white,
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.person,
                  size: 50.sp,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context, SettingsCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        bloc: cubit,
        buildWhen: (previous, current) =>
            current is ChangeUserInfoLoading ||
            current is ChangeUserInfoSuccess ||
            current is ChangeUserInfoError,
        listenWhen: (previous, current) =>
            current is ChangeUserInfoLoading ||
            current is ChangeUserInfoSuccess ||
            current is ChangeUserInfoError,
        listener: (context, state) {
          if (state is ChangeUserInfoSuccess) {
            log("✅ Success to update profile");
            cubit.emitSettingsPage();
            return HelperDialogs.showSuccess("Profile updated", context);
          } else if (state is ChangeUserInfoError) {
            log("❌ Error: ${state.error}");
            return HelperDialogs.showError(state.error, context);
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () => state is ChangeUserInfoLoading
                ? null
                : cubit.updateProfile(
                    UpdateProfileModel(
                      firstName: cubit.fNameController.text,
                      lastName: cubit.lNameController.text,
                      phoneNumber: cubit.phoneController.text,
                      gender: cubit.selectedGender,
                      dateOfBirth: cubit.dateOfBirthController.text,
                      bio: cubit.bioController.text,
                      profilePicture: cubit.profilePictureController.text,
                      country: 'egypt',
                    ),
                  ),
            style: ElevatedButton.styleFrom(
              backgroundColor: state is ChangeUserInfoLoading
                  ? AppColors.greyBlue.withAlpha(140)
                  : AppColors.mainBlue,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 4,
              shadowColor: Colors.black12,
            ),
            child: Text(
              state is ChangeUserInfoLoading
                  ? S.of(context).loading
                  : S.of(context).save_changes,
              style: FontHelper.font16BlackW600(context).copyWith(
                color: state is ChangeUserInfoLoading
                    ? AppColors.greyBlue.withAlpha(200)
                    : Colors.white,
                fontSize: 16.sp,
              ),
            ),
          );
        },
      ),
    );
  }
}
