import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/font_helper.dart';

class ModernAppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final bool showShadow;
  final bool showBorder;
  final Widget? icon;
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;

  const ModernAppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.textStyle,
    this.borderRadius,
    this.borderSide,
    this.showShadow = true,
    this.showBorder = false,
    this.icon,
    this.width,
    this.height,
    this.buttonStyle,
  });

  @override
  State<ModernAppButton> createState() => _ModernAppButtonState();
}

class _ModernAppButtonState extends State<ModernAppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onPressed != null && !widget.isLoading) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ?? AppColors.mainBlue;
    final foregroundColor = widget.foregroundColor ?? Colors.white;
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(16.r);

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            onTap: widget.isLoading ? null : widget.onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.width,
              height: widget.height ?? 48.h,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: widget.isLoading ? Colors.grey.shade400 : null,
                border: widget.showBorder
                    ? Border.all(
                        color: widget.borderSide?.color ??
                            backgroundColor.withOpacity(0.3),
                        width: widget.borderSide?.width ?? 1.5.w,
                      )
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: borderRadius,
                  onTap: widget.isLoading ? null : widget.onPressed,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.horizontalPadding ?? 20.w,
                      vertical: widget.verticalPadding ?? 12.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.isLoading)
                          SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                foregroundColor,
                              ),
                            ),
                          )
                        else ...[
                          if (widget.icon != null) ...[
                            widget.icon!,
                            SizedBox(width: 8.w),
                          ],
                          Text(
                            widget.text,
                            style: widget.textStyle ??
                                FontHelper.font16BlackW600(context).copyWith(
                                  color: foregroundColor,
                                  fontSize: 13.sp,
                                  letterSpacing: -0.5,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
