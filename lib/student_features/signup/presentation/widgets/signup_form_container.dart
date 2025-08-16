import 'package:e_learning_app/core/helpers/modern_dialog_sheet.dart';
import 'package:e_learning_app/student_features/signup/logic/cubit/signup_cubit.dart';
import 'package:e_learning_app/student_features/signup/presentation/widgets/password_and_confirm_password_statfull_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/helper_dialogs.dart';
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
            FirstAndLastNameTextFormField(cubit: cubit),
            SizedBox(height: 12.h),
            AppTextFormField(
              hintText: S.of(context).email,
              controller: cubit.emailController,
              validator: (value) => cubit.validateEmail(value, context),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12.h),
            CountryAndPhoneWidget(cubit: cubit),
            SizedBox(height: 12.h),
            ModernGenderSelector(),
            SizedBox(height: 12.h),
            PasswordAndConfirmPasswordStatfullWidget(),
            SizedBox(height: 12.h),
            ModernRoleSelector(cubit: cubit),
            SizedBox(height: 20.h),
            BlocConsumer<SignupCubit, SignupState>(
              bloc: cubit,
              listenWhen: (previous, current) =>
                  current is Success || current is Error,
              listener: (context, state) {
                if (state is Success) {
                  ModernDialogSheet.showInfo(
                    context: context,
                    title: S.of(context).emailVerification,
                    message: S.of(context).emailVerificationMessage,
                    buttonText: S.of(context).ok,
                    onPressed: () async {
                      await Navigator.of(context).pushNamedAndRemoveUntil(
                          arguments: cubit.emailController.text,
                          AppRoutes.verifyEmail,
                          (route) => false);
                      cubit.clear();
                    },
                  );
                } else if (state is Error) {
                  HelperDialogs.showError(state.error.toString(), context);
                }
              },
              buildWhen: (previous, current) =>
                  current is Loading || current is Error || current is Success,
              builder: (context, state) {
                if (state is Loading) {
                  return SizedBox(
                    width: double.infinity,
                    child: AppTextButton(
                      onPressed: null,
                      text: S.of(context).loading,
                      isLoading: true,
                    ),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.emitSignupState();
                      }
                    },
                    text: state is Error
                        ? S.of(context).tryAgain
                        : S.of(context).signup,
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
