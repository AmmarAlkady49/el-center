import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/build_geniric_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(
        context,
        title: S.of(context).settings,
        elevation: 0,
        hasIconLeading: false,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadingsettingsPage) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(),
                  verticalSpacing(16),
                  Text(
                    S.of(context).loading_your_profile,
                    style: FontHelper.font16BlackW500(context).copyWith(
                      color: AppColors.greyBlue,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LoadingSettingsPageError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48.sp,
                    color: AppColors.red,
                  ),
                  verticalSpacing(16),
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: FontHelper.font16BlackW500(context).copyWith(
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LoadedSettingsPage) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  verticalSpacing(20),
                  HelperFunctions.showUserImage(
                      state.profileInfo.profilePicture, 50.r, 110.w, 4.w),
                  verticalSpacing(10),
                  _buildUserInfo(context, state,cubit: cubit),

                  // Settings options with simpler background
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacing(16),
                        Text(
                          S.of(context).account_settings,
                          style: FontHelper.font16BlackW600(context).copyWith(
                            fontSize: 18.sp,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        verticalSpacing(10),
                        _buildModernSettingsSection(context, [
                          _SettingsOption(
                            icon: Icons.person_outline_rounded,
                            title: S.of(context).user_profile,
                            subtitle:
                                S.of(context).manage_your_personal_information,
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.personalInformation,
                                arguments: {
                                  "profileInfo": state.profileInfo,
                                  'cubit': cubit
                                },
                              );
                            },
                          ),
                          _SettingsOption(
                            icon: Icons.lock_outline_rounded,
                            title: S.of(context).change_password,
                            subtitle: S.of(context).update_your_password,
                            onTap: () {},
                          ),
                          _SettingsOption(
                            icon: Icons.language_outlined,
                            title: S.of(context).language,
                            subtitle:
                                S.of(context).choose_your_preferred_language,
                            onTap: () {
                              context.pushNamed(AppRoutes.changeLanguage);
                            },
                          ),
                          _SettingsOption(
                            icon: Icons.logout_rounded,
                            title: S.of(context).logout,
                            subtitle: S.of(context).sign_out_of_your_account,
                            isLogOut: true,
                            isDestructive: true,
                            onTap: () {},
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context, LoadedSettingsPage state,
      {required SettingsCubit cubit}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${state.profileInfo.firstName} ${state.profileInfo.lastName}",
              style: FontHelper.font16WhiteW600(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 18.sp,
              ),
            ),
            horizontalSpacing(4),
            GestureDetector(
              onTap: () {
                context.pushNamed(
                  AppRoutes.personalInformation,
                  arguments: {"profileInfo": state.profileInfo, 'cubit': cubit},
                );
              },
              child: Icon(
                Iconsax.edit,
                color: AppColors.mainBlue,
                size: 20.sp,
              ),
            )
          ],
        ),
        verticalSpacing(2),
        Text(
          state.profileInfo.email,
          style: FontHelper.font16WhiteW500(context).copyWith(
            color: AppColors.greyBlue,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildModernSettingsSection(
      BuildContext context, List<_SettingsOption> options) {
    return Container(
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
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final option = options[index];
            final isLast = index == options.length - 1;

            return _buildModernListTile(
              context,
              index: index,
              option: option,
              showDivider: !isLast,
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.grey.withAlpha(175),
              thickness: 1,
            );
          },
          itemCount: options.length),
    );
  }

  Widget _buildModernListTile(
    BuildContext context, {
    required int index,
    required _SettingsOption option,
    bool showDivider = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: option.onTap,
        borderRadius: option.isLogOut
            ? BorderRadius.only(
                bottomRight: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              )
            : (index == 0 && !option.isLogOut)
                ? BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  )
                : !showDivider
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                      )
                    : null,
        child: Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 16.h,
            bottom: !showDivider ? 20.h : 0,
          ),
          child: Row(
            children: [
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: option.isDestructive
                      ? AppColors.red.withAlpha(30)
                      : AppColors.mainBlue.withAlpha(30),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  option.icon,
                  color:
                      option.isDestructive ? AppColors.red : AppColors.mainBlue,
                  size: 20.sp,
                ),
              ),
              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: FontHelper.font16BlackW600(context).copyWith(
                        fontSize: 15.sp,
                        color: option.isDestructive
                            ? AppColors.red
                            : AppColors.darkBlue,
                      ),
                    ),
                    if (option.subtitle != null) ...[
                      verticalSpacing(2),
                      Text(
                        option.subtitle!,
                        style: FontHelper.font15BlackW400(context).copyWith(
                          color: AppColors.greyBlue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.greyBlue,
                size: 17.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsOption {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isDestructive;
  final bool isLogOut;
  final VoidCallback onTap;

  _SettingsOption({
    required this.icon,
    required this.title,
    this.subtitle,
    this.isDestructive = false,
    this.isLogOut = false,
    required this.onTap,
  });
}
