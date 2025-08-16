import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_instructor_state.dart';
import 'build_switchRow.dart';

class BuildSwitchContainer extends StatefulWidget {
  final HomeInstructorCubit cubit;
  const BuildSwitchContainer({super.key, required this.cubit});

  @override
  State<BuildSwitchContainer> createState() => _BuildSwitchContainerState();
}

class _BuildSwitchContainerState extends State<BuildSwitchContainer> {
  @override
  void dispose() {
    widget.cubit.isPublished = false;
    widget.cubit.isAIAssistantEnabled = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
      bloc: widget.cubit,
      buildWhen: (previous, current) =>
          current is TogglePublished || current is ToggleAIAssistant,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 24.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: AppColors.grey.withAlpha(120), width: 1),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainBlue.withAlpha(30),
                            AppColors.mainBlue.withAlpha(20),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Iconsax.setting_2,
                        color: AppColors.mainBlue,
                        size: 16.sp,
                      ),
                    ),
                    horizontalSpacing(10),
                    Text(
                      S.of(context).course_settings,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
                child: Column(
                  children: [
                    BuildSwitchrow(
                      label: S.of(context).published,
                      subtitle:
                          S.of(context).make_this_course_visible_to_students,
                      icon: Iconsax.eye,
                      value: widget.cubit.isPublished,
                      onChanged: (value) {
                        widget.cubit.togglePublished();
                      },
                    ),
                    Divider(color: AppColors.grey.withAlpha(120), height: 32.h),
                    BuildSwitchrow(
                      label: S.of(context).enable_ai_assistant,
                      subtitle:
                          S.of(context).provide_ai_powerd_help_to_students,
                      icon: Iconsax.cpu,
                      value: widget.cubit.isAIAssistantEnabled,
                      onChanged: (value) {
                        widget.cubit.toggleAIAssistant();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
