import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/features/onboarding/presentation/widgets/floating_progress_indecator.dart';
import 'package:e_learning_app/features/onboarding/presentation/widgets/onboarding_image_and_title.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _onboardingPageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> onboardingPages = [
      OnboardingImageAndTitle(
        thinTitle: context.loc.onboarding_thinTitle1,
        boldTitle: context.loc.onboarding_boldTitle1,
        highlightedTitle: context.loc.onboarding_highlightedTitle1,
        imagePath: "assets/svgs/onboarding/Blog_post_bro.svg",
        isOnboardingTextWidgetAboveTheImage: false,
        isFirstPage: true,
      ),
      OnboardingImageAndTitle(
        thinTitle: context.loc.onboarding_thinTitle2,
        boldTitle: context.loc.onboarding_boldTitle2,
        highlightedTitle: context.loc.onboarding_highlightedTitle2,
        imagePath: "assets/svgs/onboarding/Novelist_writing_bro.svg",
        isOnboardingTextWidgetAboveTheImage: true,
        isBoldTitleNeeded: false,
      ),
      OnboardingImageAndTitle(
        thinTitle: context.loc.onboarding_thinTitle3,
        boldTitle: context.loc.onboarding_boldTitle3,
        highlightedTitle: context.loc.onboarding_highlightedTitle3,
        imagePath: "assets/svgs/onboarding/Blogging_bro.svg",
        isOnboardingTextWidgetAboveTheImage: false,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => onboardingPages[index],
                itemCount: onboardingPages.length,
                controller: _onboardingPageController,
                onPageChanged: (index) {
                  setState(
                    () {
                      _currentPage = index;
                    },
                  );
                },
              ),
            ),
            FloatingProgressIndecator(
              totalPages: onboardingPages.length,
              currentPage: _currentPage,
              onNextPressed: () {
                _currentPage == onboardingPages.length - 1
                    ? Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.loginScreen,
                      )
                    : _onboardingPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
