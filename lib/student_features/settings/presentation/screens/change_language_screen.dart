import 'dart:developer';

import 'package:e_learning_app/core/di/dependency_injection.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/settings_cubit.dart';
import '../../logic/cubit/settings_state.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  // late String selectedLanguage;
  late SettingsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<SettingsCubit>();
    _loadLanguage();
  }

  void _loadLanguage() async {
    await cubit.loadSavedLanguage();
    log('Initial selectedLanguage: ${cubit.selectedLanguage}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(
        context,
        title: S.of(context).language_settings,
        elevation: 8,
        backgroundColor: AppColors.mainBlue,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        bloc: cubit,
        builder: (context, state) {
          // Use the local selectedLanguage or fall back to cubit's language
          final String currentLanguage = cubit.selectedLanguage ?? 'en';

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).available_languages,
                  style: FontHelper.font16WhiteW600(context).copyWith(
                    color: AppColors.darkBlue,
                    fontSize: 18.sp,
                  ),
                ),
                verticalSpacing(16),
                _buildLanguageOption(
                  'English',
                  'English',
                  '🇺🇸',
                  'en',
                  currentLanguage,
                ),
                verticalSpacing(16),
                _buildLanguageOption(
                  'Arabic',
                  'العربية',
                  '🇸🇦',
                  'ar',
                  currentLanguage,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLanguageOption(
    String language,
    String nativeText,
    String flag,
    String value,
    String currentLanguage,
  ) {
    final bool isSelected = currentLanguage == value;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.mainBlue : AppColors.grey,
          width: isSelected ? 2 : 1,
        ),
        color: isSelected ? AppColors.mainBlue.withAlpha(30) : Colors.white,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(30),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Only change if it's different from current selection
            if (cubit.selectedLanguage != value) {
              setState(() {
                cubit.selectedLanguage = value;
                getIt<SettingsCubit>().changeLanguage(value);
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Flag
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.grey.withAlpha(200),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      flag,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),

                horizontalSpacing(16),

                // Language Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        language,
                        style: FontHelper.font16BlackW600(context).copyWith(
                          color: isSelected
                              ? AppColors.mainBlue
                              : AppColors.darkBlue,
                          fontSize: 18.sp,
                        ),
                      ),
                      verticalSpacing(4),
                      Text(nativeText,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: AppColors.greyBlue,
                          )),
                    ],
                  ),
                ),

                // Selection Indicator
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? AppColors.mainBlue : AppColors.grey,
                      width: 2,
                    ),
                    color: isSelected ? AppColors.mainBlue : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
