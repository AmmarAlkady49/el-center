import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/build_geniric_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/settings_state.dart';

class PersonalInfoScreen extends StatelessWidget {
  final ProfileAccountModel profileInfo;
  const PersonalInfoScreen({super.key, required this.profileInfo});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(
        context,
        title: S.of(context).personal_information,
        elevation: 8,
        backgroundColor: AppColors.mainBlue,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        bloc: cubit,
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                verticalSpacing(20),
                _buildProfileSection(context),
                verticalSpacing(32),
                _buildPersonalInfoForm(context),
                verticalSpacing(40),
                _buildSaveButton(context),
                verticalSpacing(40),
              ],
            ),
          );
        },
      ),
    );
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

  Widget _buildPersonalInfoForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyBlue.withAlpha(80),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).personal_information,
                  style: FontHelper.font20BlackW700(context).copyWith(
                    fontSize: 19.sp,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
              // verticalSpacing(8),
              Divider(
                // endIndent: 45.w,
                // indent: 45.w,
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              verticalSpacing(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: _buildModernTextField(
                      context,
                      label: S.of(context).firstName,
                      value: profileInfo.firstName,
                      icon: Iconsax.user,
                    ),
                  ),
                  horizontalSpacing(16),
                  Expanded(
                    child: _buildModernTextField(
                      context,
                      label: S.of(context).lastName,
                      value: profileInfo.lastName,
                      icon: Iconsax.user,
                    ),
                  ),
                ],
              ),
              verticalSpacing(20),
              _buildModernTextField(
                context,
                label: S.of(context).email,
                value: profileInfo.email,
                icon: CupertinoIcons.mail,
                enabled: false,
              ),
              verticalSpacing(20),
              _buildModernTextField(
                context,
                label: S.of(context).phoneNumber,
                value: profileInfo.phoneNumber,
                icon: Icons.call_outlined,
              ),
              verticalSpacing(20),
              _buildModernTextField(
                context,
                label: S.of(context).date_of_birth,
                value: profileInfo.dateOfBirth,
                icon: Icons.calendar_month_outlined,
                readOnly: true,
                onTap: () => HelperDialogs.selectDate(context),
              ),
              verticalSpacing(20),
              _buildModernTextField(
                context,
                label: S.of(context).bio,
                value: profileInfo.bio ?? S.of(context).no_bio_provided,
                icon: Icons.description_outlined,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    bool enabled = true,
    bool readOnly = false,
    int maxLines = 1,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FontHelper.font16BlackW600(context).copyWith(
            color: AppColors.darkBlue,
            fontSize: 14.sp,
          ),
        ),
        verticalSpacing(8),
        TextFormField(
          initialValue: value,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          onTap: onTap,
          style: FontHelper.font16BlackW500(context).copyWith(
            color: enabled ? AppColors.darkBlue : AppColors.greyBlue,
          ),
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: EdgeInsets.all(12.w),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: AppColors.mainBlue.withAlpha(40),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: AppColors.mainBlue,
                size: 18.sp,
              ),
            ),
            filled: true,
            fillColor:
                enabled ? Colors.white : AppColors.greyBlue.withAlpha(40),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.mainBlue.withAlpha(100),
                width: 1.0.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.4.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.mainBlue,
                width: 1.6.w,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            hintText: "${S.of(context).enter} $label",
            hintStyle: FontHelper.font12lackW400(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainBlue,
              AppColors.mainBlue.withAlpha(200),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.mainBlue.withAlpha(60),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16.r),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  horizontalSpacing(8),
                  Text(
                    S.of(context).save_changes,
                    style: FontHelper.font16BlackW600(context).copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
