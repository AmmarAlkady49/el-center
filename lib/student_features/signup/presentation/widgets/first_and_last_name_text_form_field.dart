import 'package:e_learning_app/core/widgets/app_text_form_field.dart';
import 'package:e_learning_app/student_features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class FirstAndLastNameTextFormField extends StatelessWidget {
  final SignupCubit cubit;
  const FirstAndLastNameTextFormField({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: AppTextFormField(
          hintText: S.of(context).firstName,
          controller: cubit.firstNameController,
          validator: (value) =>
              cubit.validateFirstAndLastName(value, context, isFirstName: true),
          maxLength: 12,
        ),
      ),
      SizedBox(width: 10.w),
      Expanded(
        child: AppTextFormField(
          hintText: S.of(context).lastName,
          controller: cubit.lastNameController,
          validator: (value) => cubit.validateFirstAndLastName(
            value,
            context,
            isFirstName: false,
          ),
          maxLength: 12,
        ),
      ),
    ]);
  }
}
