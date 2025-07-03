import 'package:e_learning_app/core/widgets/app_text_form_field.dart';
import 'package:e_learning_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class FirstAndLastNameTextFormField extends StatelessWidget {
  const FirstAndLastNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
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
      const SizedBox(width: 10),
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
