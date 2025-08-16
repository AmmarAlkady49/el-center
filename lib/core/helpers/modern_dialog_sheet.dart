import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ModernDialogSheet {
  // Generic dialog with customizable content
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    Widget? customContent,
    String? primaryButtonText,
    String? secondaryButtonText,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    Color? primaryButtonColor,
    Color? backgroundColor,
    IconData? icon,
    Color? iconColor,
    bool barrierDismissible = true,
    double? width,
    double? height,
    bool showCloseButton = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.all(16.w),
          child: Container(
            width: width ?? 340.w,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with close button
                  if (showCloseButton)
                    Container(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        right: 20.w,
                        left: 20.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Iconsax.close_circle,
                                size: 20.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Content
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: showCloseButton ? 12.h : 24.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon section with modern styling
                          if (icon != null) ...[
                            Container(
                              width: 72.w,
                              height: 72.h,
                              decoration: BoxDecoration(
                                color: (iconColor ?? AppColors.mainBlue)
                                    .withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                icon,
                                size: 36.sp,
                                color: iconColor ?? AppColors.mainBlue,
                              ),
                            ),
                            SizedBox(height: 24.h),
                          ],

                          // Title with better typography
                          Text(
                            title,
                            style: FontHelper.font20BlackW700(context).copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF111827),
                              letterSpacing: -0.02,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 12.h),

                          // Message with improved readability
                          Text(
                            message,
                            style: FontHelper.font16BlackW500(context).copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6B7280),
                              height: 1.5,
                              letterSpacing: 0.01,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          // Custom content
                          if (customContent != null) ...[
                            SizedBox(height: 20.h),
                            customContent,
                          ],

                          SizedBox(height: 28.h),

                          // Modern button layout
                          _buildActionButtons(
                            context: context,
                            primaryButtonText: primaryButtonText,
                            secondaryButtonText: secondaryButtonText,
                            onPrimaryPressed: onPrimaryPressed,
                            onSecondaryPressed: onSecondaryPressed,
                            primaryButtonColor: primaryButtonColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildActionButtons({
    required BuildContext context,
    String? primaryButtonText,
    String? secondaryButtonText,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    Color? primaryButtonColor,
  }) {
    final hasSecondary = secondaryButtonText != null;

    return Column(
      children: [
        // Primary button
        if (primaryButtonText != null)
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: onPrimaryPressed ?? () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryButtonColor ?? AppColors.mainBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                primaryButtonText,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

        // Secondary button
        if (hasSecondary) ...[
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: TextButton(
              onPressed:
                  onSecondaryPressed ?? () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[50],
                foregroundColor: Colors.grey[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                secondaryButtonText,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: Colors.grey[700],
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  // Success dialog
  static Future<T?> showSuccess<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return show<T>(
      context: context,
      title: title,
      message: message,
      icon: Iconsax.tick_circle,
      iconColor: const Color(0xFF059669),
      primaryButtonText: buttonText ?? "Great!",
      onPrimaryPressed: onPressed,
      primaryButtonColor: const Color(0xFF059669),
    );
  }

  // Error dialog
  static Future<T?> showError<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return show<T>(
      context: context,
      title: title,
      message: message,
      icon: Iconsax.close_circle,
      iconColor: const Color(0xFFDC2626),
      primaryButtonText: buttonText ?? "I understand",
      onPrimaryPressed: onPressed,
      primaryButtonColor: const Color(0xFFDC2626),
    );
  }

  // Warning dialog
  static Future<T?> showWarning<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return show<T>(
      context: context,
      title: title,
      message: message,
      icon: Iconsax.warning_2,
      iconColor: const Color(0xFFD97706),
      primaryButtonText: buttonText ?? "Got it",
      onPrimaryPressed: onPressed,
      primaryButtonColor: const Color(0xFFD97706),
    );
  }

  // Confirmation dialog
  static Future<bool?> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmButtonColor,
    IconData? icon,
    Color? iconColor,
  }) {
    return show<bool>(
      context: context,
      title: title,
      message: message,
      icon: icon ?? Iconsax.message_question,
      iconColor: iconColor ?? AppColors.mainBlue,
      primaryButtonText: confirmText ?? "Confirm",
      secondaryButtonText: cancelText ?? "Cancel",
      primaryButtonColor: confirmButtonColor ?? AppColors.mainBlue,
      onPrimaryPressed: () {
        Navigator.of(context).pop(true);
        onConfirm?.call();
      },
      onSecondaryPressed: () {
        Navigator.of(context).pop(false);
        onCancel?.call();
      },
    );
  }

  // Delete confirmation dialog (special styling)
  static Future<bool?> showDeleteConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return show<bool>(
      context: context,
      title: title,
      message: message,
      icon: Iconsax.trash,
      iconColor: const Color(0xFFDC2626),
      primaryButtonText: confirmText ?? "Delete",
      secondaryButtonText: cancelText ?? "Keep",
      primaryButtonColor: const Color(0xFFDC2626),
      onPrimaryPressed: () {
        Navigator.of(context).pop(true);
        onConfirm?.call();
      },
      onSecondaryPressed: () {
        Navigator.of(context).pop(false);
        onCancel?.call();
      },
    );
  }

  // Loading dialog with modern spinner
  static Future<T?> showLoading<T>({
    required BuildContext context,
    String? title,
    String? message,
    bool showProgress = false,
    double? progress,
  }) {
    return show<T>(
      context: context,
      title: title ?? "Please wait",
      message: message ?? "Processing your request...",
      customContent: Column(
        children: [
          if (showProgress && progress != null) ...[
            Container(
              width: double.infinity,
              height: 6.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              '${(progress * 100).round()}%',
              style: FontHelper.font15BlackW600(context).copyWith(
                color: AppColors.mainBlue,
              ),
            ),
          ] else ...[
            SizedBox(
              width: 32.w,
              height: 32.h,
              child: CircularProgressIndicator(
                strokeWidth: 3.w,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
              ),
            ),
          ],
        ],
      ),
      barrierDismissible: false,
      showCloseButton: false,
    );
  }

  // Info dialog
  static Future<T?> showInfo<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return show<T>(
      context: context,
      title: title,
      message: message,
      icon: Iconsax.info_circle,
      iconColor: AppColors.mainBlue,
      primaryButtonText: buttonText ?? "Got it",
      onPrimaryPressed: onPressed,
    );
  }

  // Custom input dialog
  static Future<String?> showInput({
    required BuildContext context,
    required String title,
    required String message,
    String? hintText,
    String? initialValue,
    String? confirmText,
    String? cancelText,
    TextInputType? keyboardType,
    int? maxLength,
  }) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    return show<String>(
      context: context,
      title: title,
      message: message,
      icon: Iconsax.edit,
      iconColor: AppColors.mainBlue,
      customContent: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style: FontHelper.font15BlackW600(context),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: FontHelper.font15BlackW600(context).copyWith(
              color: Colors.grey[500],
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16.w),
            counterText: '',
          ),
        ),
      ),
      primaryButtonText: confirmText ?? "Save",
      secondaryButtonText: cancelText ?? "Cancel",
      onPrimaryPressed: () {
        Navigator.of(context).pop(controller.text.trim());
      },
    );
  }
}
