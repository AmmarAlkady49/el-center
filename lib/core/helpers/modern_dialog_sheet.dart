import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          backgroundColor: backgroundColor ?? AppColors.backgroundWiteColor,
          child: Container(
            width: width ?? 320,
            height: height,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: backgroundColor ?? AppColors.backgroundWiteColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon section
                if (icon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: (iconColor ?? Colors.blue).withAlpha(30),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      size: 32,
                      color: iconColor ?? Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],

                // Title
                Text(
                  title,
                  style: FontHelper.font20BlackW700(context).copyWith(
                    color: const Color(0xFF1F2937),
                    height: 1.5,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 12.h),

                // Message
                Text(
                  message,
                  style: FontHelper.font16BlackW500(context).copyWith(
                    color: const Color(0xFF4B5563),
                    height: 1.5,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Custom content
                if (customContent != null) ...[
                  const SizedBox(height: 16),
                  customContent,
                ],

                SizedBox(height: 14.h),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (secondaryButtonText != null) ...[
                      TextButton(
                        onPressed: onSecondaryPressed ??
                            () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          secondaryButtonText,
                          style: FontHelper.font16BlackW600(context).copyWith(
                            color: const Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    if (primaryButtonText != null)
                      TextButton(
                        onPressed: onPrimaryPressed ??
                            () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              (primaryButtonColor ?? const Color(0xFF3B82F6))
                                  .withAlpha(30),
                          foregroundColor:
                              primaryButtonColor ?? const Color(0xFF3B82F6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          primaryButtonText,
                          style: FontHelper.font15BlackW600(context).copyWith(
                            color:
                                primaryButtonColor ?? const Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
      icon: Icons.check_circle,
      iconColor: const Color(0xFF10B981),
      primaryButtonText: buttonText ?? "Got it",
      onPrimaryPressed: onPressed,
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
      icon: Icons.error,
      iconColor: const Color(0xFFEF4444),
      primaryButtonText: buttonText ?? "Understood",
      onPrimaryPressed: onPressed,
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
      icon: Icons.warning,
      iconColor: const Color(0xFFF59E0B),
      primaryButtonText: buttonText ?? "Got it",
      onPrimaryPressed: onPressed,
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
      icon: icon ?? Icons.help_outline,
      iconColor: iconColor ?? const Color(0xFF3B82F6),
      primaryButtonText: confirmText ?? "Confirm",
      secondaryButtonText: cancelText ?? "Cancel",
      primaryButtonColor: confirmButtonColor,
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

  // Loading dialog
  static Future<T?> showLoading<T>({
    required BuildContext context,
    String? title,
    String? message,
  }) {
    return show<T>(
      context: context,
      title: title ?? "Loading",
      message: message ?? "Please wait...",
      customContent: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
        ),
      ),
      barrierDismissible: false,
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
      icon: Icons.info,
      iconColor: const Color(0xFF3B82F6),
      primaryButtonText: buttonText ?? "Got it",
      onPrimaryPressed: onPressed,
    );
  }
}
