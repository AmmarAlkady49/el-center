import 'package:e_learning_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class SelectGenderWidget extends StatefulWidget {
  final SettingsCubit cubit;
  const SelectGenderWidget({super.key, required this.cubit});

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  late String selectedGender;
  late SettingsCubit settingsCubit;

  @override
  void initState() {
    super.initState();
    settingsCubit = widget.cubit;
    selectedGender = settingsCubit.selectedGender;
  }

  @override
  void dispose() {
    settingsCubit.selectedGender = 'male';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildGenderOption(
              context: context,
              value: 'male',
              label: S.of(context).male,
              icon: Iconsax.man,
              activeColor: Colors.blueAccent,
            ),
          ),
          Container(
            height: 25.h,
            width: 1,
            color: Colors.grey.withAlpha(80),
          ),
          Expanded(
            child: _buildGenderOption(
              context: context,
              value: 'female',
              label: S.of(context).female,
              icon: Iconsax.woman,
              activeColor: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption({
    required BuildContext context,
    required String value,
    required String label,
    required IconData icon,
    required Color activeColor,
  }) {
    final bool isSelected = selectedGender == value;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          selectedGender = value;
          widget.cubit.selectedGender = selectedGender;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color:
                    isSelected ? activeColor.withAlpha(60) : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 18.sp,
                color: isSelected ? activeColor : Colors.grey,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: FontHelper.font15BlackW600(context).copyWith(
                    color: isSelected ? activeColor : Colors.grey.shade600,
                    fontSize: isSelected ? 14.sp : 13.sp,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 25.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: isSelected ? activeColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
