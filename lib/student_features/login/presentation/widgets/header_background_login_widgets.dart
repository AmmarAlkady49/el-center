import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'title_sign_of_auth_pages.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Image.asset(
              'assets/images/background_image.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSignOfAuthPages(
                    title: S.of(context).signinToYourAccount,
                    normalSubtitle: "${S.of(context).dontHaveAnAccount} ",
                    clickableText: S.of(context).signup,
                  ),
                ],
              ),
            ),
      ],
    );
  }
}