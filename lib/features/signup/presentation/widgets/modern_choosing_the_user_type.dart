import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/signup_cubit.dart';

class ModernRoleSelector extends StatefulWidget {
  const ModernRoleSelector({
    super.key,
  });

  @override
  State<ModernRoleSelector> createState() => _ModernRoleSelectorState();
}

class _ModernRoleSelectorState extends State<ModernRoleSelector> {
  late String selectedRole;
  late SignupCubit signupCubit;

  @override
  void initState() {
    super.initState();
    signupCubit = BlocProvider.of<SignupCubit>(context);
    selectedRole = signupCubit.selectedRole;
  }

  @override
  void dispose() {
    signupCubit.selectedRole = 'Student';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildRoleOption(
              context: context,
              value: 'Student',
              label: S.of(context).student,
              icon: Iconsax.book,
              activeColor: AppColors.mainBlue,
            ),
          ),
          Container(
            height: 25.h,
            width: 1,
            color: Colors.grey.withAlpha(80),
          ),
          Expanded(
            child: _buildRoleOption(
              context: context,
              value: 'Instructor',
              label: S.of(context).teacher,
              icon: Iconsax.teacher,
              activeColor: AppColors.mainBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleOption({
    required BuildContext context,
    required String value,
    required String label,
    required IconData icon,
    required Color activeColor,
  }) {
    final bool isSelected = selectedRole == value;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          selectedRole = value;
          // BlocProvider.of<SignupCubit>(context).selectedRole = selectedRole;
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
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color:
                    isSelected ? activeColor.withAlpha(60) : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20.sp,
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
                    fontSize: isSelected ? 15.sp : 13.sp,
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
