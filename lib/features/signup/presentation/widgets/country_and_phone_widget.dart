import 'package:e_learning_app/core/widgets/app_text_form_field.dart';
import 'package:e_learning_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/country_code_picker.dart';
import '../../../../generated/l10n.dart';

class CountryAndPhoneWidget extends StatelessWidget {
  const CountryAndPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return AppTextFormField(
      hintText: S.of(context).phoneNumber,
      controller: cubit.phoneNumberController,
      validator: (value) => cubit.validatePhoneNumber(value, context),
      suffixIcon: CountryCodePickerWidget(),
      maxLength: 10,
      textDirection: TextDirection.ltr,
    );
  }
}
