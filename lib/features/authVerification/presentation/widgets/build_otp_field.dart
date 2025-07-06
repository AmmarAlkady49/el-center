import 'dart:developer';

import 'package:e_learning_app/features/authVerification/data/model/active_account_request_body.dart';
import 'package:e_learning_app/features/authVerification/logic/cubit/verification_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class BuildOtpField extends StatefulWidget {
  final VerificationAccountCubit cubit;
  final int index;
  final String email;
  const BuildOtpField(
      {super.key,
      required this.cubit,
      required this.index,
      required this.email});

  @override
  State<BuildOtpField> createState() => _BuildOtpFieldState();
}

class _BuildOtpFieldState extends State<BuildOtpField> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.cubit.focusNodes[widget.index];
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 40.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: widget.cubit.focusNodes[widget.index].hasFocus
              ? AppColors.mainBlue
              : Colors.black12,
          width: 2,
        ),
      ),
      child: TextField(
        controller: widget.cubit.otpController[widget.index],
        focusNode: widget.cubit.focusNodes[widget.index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style:
            FontHelper.font16BlackW600(context).copyWith(color: Colors.black87),
        decoration: const InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && widget.index < 5) {
            FocusScope.of(context)
                .requestFocus(widget.cubit.focusNodes[widget.index + 1]);
          } else if (value.isEmpty && widget.index > 0) {
            FocusScope.of(context)
                .requestFocus(widget.cubit.focusNodes[widget.index - 1]);
          } else {
            final otpCode = widget.cubit.otpController
                .map((controller) => controller.text)
                .join();
            log(otpCode);
            if (otpCode.length == 6) {
              FocusScope.of(context).unfocus();

              widget.cubit.activeAccount(
                  ActiveAccountRequestBody(email: widget.email, code: otpCode));
            }
          }
        },
      ),
    );
  }
}
