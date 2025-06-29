import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/features/onboarding/presentation/widgets/change_language.dart';
import 'package:e_learning_app/features/onboarding/presentation/widgets/on_boarding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingImageAndTitle extends StatelessWidget {
  final String thinTitle;
  final String boldTitle;
  final String highlightedTitle;
  final String imagePath;
  final bool isOnboardingTextWidgetAboveTheImage;
  final bool isBoldTitleNeeded;
  final bool isFirstPage;
  const OnboardingImageAndTitle(
      {super.key,
      required this.thinTitle,
      required this.boldTitle,
      required this.highlightedTitle,
      required this.imagePath,
      this.isOnboardingTextWidgetAboveTheImage = false,
      this.isBoldTitleNeeded = true,
      this.isFirstPage = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: context.screenHeight * 0.03,
          // right: context.screenWidth * 0.05,
          child: Visibility(
            visible: isFirstPage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ChangeLanguage(),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: isFirstPage
                    ? context.screenHeight * 0.04
                    : isOnboardingTextWidgetAboveTheImage != true
                        ? context.screenHeight * 0.0
                        : context.screenHeight * 0.05),
            Visibility(
              visible: isOnboardingTextWidgetAboveTheImage == true,
              child: OnBoardingText(
                thinTitle: thinTitle,
                boldTitle: boldTitle,
                highlightedTitle: highlightedTitle,
                isBoldTitleNeeded: isBoldTitleNeeded,
              ),
            ),
            SvgPicture.asset(
              alignment: Alignment.center,
              imagePath,
              width: double.infinity,
              height: context.screenHeight * 0.62,
              fit: BoxFit.fitHeight,
            ),
            Visibility(
              visible: isOnboardingTextWidgetAboveTheImage == false,
              child: OnBoardingText(
                thinTitle: thinTitle,
                boldTitle: boldTitle,
                highlightedTitle: highlightedTitle,
                isBoldTitleNeeded: isBoldTitleNeeded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
