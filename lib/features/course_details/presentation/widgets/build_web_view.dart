import 'dart:developer';

import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/course_details_state.dart';

class BuildWebView extends StatelessWidget {
  final CourseDetailsCubit cubit;
  final String? paymentUrl;
  final VoidCallback onCancel;
  const BuildWebView(
      {super.key,
      required this.cubit,
      required this.paymentUrl,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onPageFinished: (url) {
                    if (url.contains("success=true")) {
                      cubit.emit(
                          CourseDetailsState.paymentSuccess({'url': url}));
                      log('payment success');
                    } else if (url.contains("success=false")) {
                      cubit.emit(CourseDetailsState.paymentFailure(
                          error: "Payment failed"));
                    }
                  },
                ),
              )
              ..loadRequest(Uri.parse(paymentUrl!)),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onCancel,
              child: const Icon(Icons.close, color: AppColors.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
