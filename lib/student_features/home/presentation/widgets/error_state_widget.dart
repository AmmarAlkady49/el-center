import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorStateWidget extends StatefulWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;
  final String? customTitle;
  final String? customSubtitle;

  const ErrorStateWidget({
    super.key,
    this.errorMessage,
    this.onRetry,
    this.customTitle,
    this.customSubtitle,
  });

  @override
  State<ErrorStateWidget> createState() => _ErrorStateWidgetState();
}

class _ErrorStateWidgetState extends State<ErrorStateWidget>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _fadeController;
  late Animation<double> _bounceAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    ));

    // Start animations
    _bounceController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Error Icon
          ScaleTransition(
            scale: _bounceAnimation,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red.shade400,
                    Colors.red.shade600,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withAlpha(100),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                CupertinoIcons.exclamationmark_triangle,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),

          verticalSpacing(32),

          // Animated Title and Subtitle
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  Text(
                    widget.customTitle ?? 'Oops! Something went wrong',
                    style: FontHelper.font20BlackW700(context).copyWith(
                      color: isDark ? Colors.white : Colors.grey.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  verticalSpacing(12),

                  Text(
                    widget.customSubtitle ??
                        'We encountered an issue while loading your content. Don\'t worry, it happens to the best of us!',
                    style: FontHelper.font16BlackW500(context).copyWith(
                      color: isDark ? Colors.white : Colors.grey.shade500,
                      height: 1.5,
                      fontSize: 13.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // Error details (if provided)
                  if (widget.errorMessage != null) ...[
                    verticalSpacing(16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.grey.shade900.withAlpha(150)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark
                              ? Colors.grey.shade700
                              : Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.info_circle,
                            size: 16,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.errorMessage!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isDark
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade600,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          verticalSpacing(40),

          // Animated Retry Button
          if (widget.onRetry != null)
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _RetryButton(
                  onPressed: widget.onRetry!,
                  isDark: isDark,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RetryButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isDark;

  const _RetryButton({
    required this.onPressed,
    required this.isDark,
  });

  @override
  State<_RetryButton> createState() => _RetryButtonState();
}

class _RetryButtonState extends State<_RetryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
          _controller.forward();
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          _controller.reverse();
          widget.onPressed();
        },
        onTapCancel: () {
          setState(() => _isPressed = false);
          _controller.reverse();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _isPressed
                  ? [
                      Theme.of(context).primaryColor.withAlpha(200),
                      Theme.of(context).primaryColor.withAlpha(170),
                    ]
                  : [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withAlpha(200),
                    ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isPressed
                ? []
                : [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withAlpha(100),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.refresh,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
