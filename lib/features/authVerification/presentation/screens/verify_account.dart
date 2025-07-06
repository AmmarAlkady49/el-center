import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/verification_account_cubit.dart';
import '../../logic/cubit/verification_account_state.dart';
import '../widgets/build_otp_field.dart';

class VerifyAccount extends StatefulWidget {
  final String email;
  const VerifyAccount({super.key, this.email = 'ammaralkady49@gmail.com'});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerificationAccountCubit>();
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 85.h),
        child: Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/email_image.png', height: 200.h),
              Text(
                S.of(context).otpVerification,
                style: FontHelper.font24BlackW700(context).copyWith(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                "${S.of(context).otpVerificationMessage} ${widget.email}",
                textAlign: TextAlign.center,
                style: FontHelper.font16BlackW500(context)
                    .copyWith(color: Colors.black54, fontSize: 15.sp),
              ),
              SizedBox(height: 36.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => BuildOtpField(
                      index: index,
                      cubit: cubit,
                      email: widget.email,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              BlocConsumer<VerificationAccountCubit, VerificationAccountState>(
                bloc: cubit,
                listenWhen: (previous, current) =>
                    current is ActiveAccountError ||
                    current is ActiveAccountSuccess,
                listener: (context, state) async {
                  if (state is ActiveAccountError) {
                    HelperFunctions.showError(state.error, context);
                  }
                  if (state is ActiveAccountSuccess) {
                    HelperFunctions.showSuccess(state.data, context);
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: S.of(context).didnotReceiveCode,
                          style: FontHelper.font15BlackW400(context)
                              .copyWith(fontSize: 14.sp),
                          children: [
                            TextSpan(
                              text: " ${S.of(context).resend}",
                              style: FontHelper.font15BlackW600(context)
                                  .copyWith(
                                      color: AppColors.mainBlue,
                                      fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      if (state is ActiveAccountLoading)
                        CupertinoActivityIndicator(
                          color: Colors.black45,
                          radius: 14.sp,
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
