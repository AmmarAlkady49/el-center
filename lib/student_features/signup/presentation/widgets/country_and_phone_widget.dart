import 'package:e_learning_app/core/widgets/app_text_form_field.dart';
import 'package:e_learning_app/student_features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/country_code_picker.dart';
import '../../../../generated/l10n.dart';

class CountryAndPhoneWidget extends StatelessWidget {
  final SignupCubit cubit;
  const CountryAndPhoneWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    return AppTextFormField(
      hintText: S.of(context).phoneNumber,
      controller: cubit.phoneNumberController,
      validator: (value) => cubit.validatePhoneNumber(value, context),
      suffixIcon: langCode == 'en' ? null : CountryCodePickerWidget(),
      prefixIcon: langCode == 'en' ? CountryCodePickerWidget() : null,
      maxLength: 10,
      keyboardType: TextInputType.phone,
      textDirection: TextDirection.ltr,
    );
  }
}
