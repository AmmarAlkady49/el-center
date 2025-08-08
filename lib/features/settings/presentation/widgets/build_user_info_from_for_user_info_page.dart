import 'package:e_learning_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:e_learning_app/features/settings/presentation/widgets/select_gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildUserInfoFromForUserInfoPage extends StatelessWidget {
  final ProfileAccountModel profileInfo;
  final SettingsCubit cubit;
  const BuildUserInfoFromForUserInfoPage(
      {super.key, required this.profileInfo, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyBlue.withAlpha(80),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildModernTextField(
                      context,
                      label: S.of(context).firstName,
                      controller: cubit.fNameController,
                    ),
                  ),
                  horizontalSpacing(16),
                  Expanded(
                    child: _buildModernTextField(
                      context,
                      label: S.of(context).lastName,
                      controller: cubit.lNameController,
                    ),
                  ),
                ],
              ),
              verticalSpacing(12),
              Text(
                S.of(context).gender,
                style: FontHelper.font16BlackW500(context).copyWith(
                  color: Colors.black87,
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacing(4),
              SelectGenderWidget(cubit: cubit),
              verticalSpacing(12),
              _buildModernTextField(
                context,
                label: S.of(context).phoneNumber,
                icon: Iconsax.call,
                controller: cubit.phoneController,
              ),
              verticalSpacing(12),
              _buildModernTextField(
                context,
                label: S.of(context).date_of_birth,
                icon: Iconsax.calendar_2,
                readOnly: true,
                onTap: () => HelperDialogs.selectDate(context),
                controller: cubit.dateOfBirthController,
              ),
              verticalSpacing(12),
              _buildModernTextField(
                context,
                label: S.of(context).bio,
                maxLines: 1,
                controller: cubit.bioController,
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
    required TextEditingController controller,
    IconData? icon,
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
          style: FontHelper.font16BlackW500(context).copyWith(
            color: Colors.black87,
            fontSize: 14.sp,
          ),
        ),
        verticalSpacing(4),
        TextFormField(
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          onTap: onTap,
          style: FontHelper.font16BlackW500(context).copyWith(
            color: enabled ? Colors.black87 : Colors.black54,
          ),
          decoration: InputDecoration(
            prefixIcon: icon == null
                ? null
                : Container(
                    margin: EdgeInsets.all(10.w),
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue.withAlpha(40),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.mainBlue,
                      size: 16.sp,
                    ),
                  ),
            filled: true,
            fillColor:
                enabled ? Colors.white : AppColors.greyBlue.withAlpha(30),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.mainBlue.withAlpha(100),
                width: 1.0.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:
                  BorderSide(color: Colors.grey.withAlpha(150), width: 1.0.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.mainBlue.withAlpha(200),
                width: 1.4.w,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            hintText: label,
            hintStyle: FontHelper.font10BlackW500(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
