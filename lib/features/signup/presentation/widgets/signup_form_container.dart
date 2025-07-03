import 'package:e_learning_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:e_learning_app/features/signup/presentation/widgets/password_and_confirm_password_statfull_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/signup_state.dart';
import 'country_and_phone_widget.dart';
import 'first_and_last_name_text_form_field.dart';
import 'modern_choosing_the_user_type.dart';
import 'modern_gender_selector.dart';

class SignupFormContainer extends StatelessWidget {
  const SignupFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
      ),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            FirstAndLastNameTextFormField(),
            const SizedBox(height: 14),
            AppTextFormField(
              hintText: S.of(context).email,
              controller: cubit.emailController,
              validator: (value) => cubit.validateEmail(value, context),
            ),
            const SizedBox(height: 14),
            CountryAndPhoneWidget(),
            const SizedBox(height: 14),
            ModernGenderSelector(),
            const SizedBox(height: 14),
            PasswordAndConfirmPasswordStatfullWidget(),
            const SizedBox(height: 14),
            ModernRoleSelector(),
            const SizedBox(height: 24),
            BlocConsumer<SignupCubit, SignupState>(
              bloc: cubit,
              listenWhen: (previous, current) => current is Success,
              listener: (context, state) {
                if (state is Success) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.loginScreen, (route) => false);
                }
              },
              buildWhen: (previous, current) =>
                  current is Loading || current is Error,
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.emitSignupState();
                      }
                    },
                    text: S.of(context).register,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
