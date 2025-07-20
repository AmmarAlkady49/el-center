import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_page.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

import 'my_learning/presentation/screens/my_learning_page.dart';
import 'search/presentation/screens/search_page.dart';
import 'settings/presentation/screens/settings_page.dart';

class MainBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const MainBottomNavBar({super.key, this.selectedIndex = 0});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  // int _selectedIndex =  0;
  late int _selectedIndex;
  static List screenOptions = [
    HomePage(),
    SearchPage(),
    MyLearningPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  bool isConnected = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => setState(() {
        _selectedIndex = 0;
      }),
      child: Scaffold(
        backgroundColor: AppColors.backgroundWiteColor,
        body: screenOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundWiteColor,
            border: Border(top: BorderSide(color: Colors.black12)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.6),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SafeArea(
            bottom: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
              child: GNav(
                textStyle: FontHelper.font16WhiteW600(context).copyWith(
                  color: Colors.white,
                  fontSize: _selectedIndex == 2 ? 13.sp : 14.sp,
                ),
                hoverColor: Colors.grey[200]!,
                gap: 8.w,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: AppColors.mainBlue,
                color: Colors.black54,
                tabs: [
                  GButton(
                    icon: _selectedIndex == 0 ? Iconsax.home : Iconsax.home,
                    text: S.of(context).home,
                    iconActiveColor: _selectedIndex == 0 ? Colors.white : null,
                  ),
                  GButton(
                    icon: _selectedIndex == 1
                        ? Iconsax.search_normal_1
                        : Iconsax.search_normal_1,
                    text: S.of(context).search,
                    iconActiveColor: _selectedIndex == 1 ? Colors.white : null,
                  ),
                  GButton(
                    icon: _selectedIndex == 2 ? Iconsax.book : Iconsax.book,
                    text: S.of(context).my_learning,
                    iconActiveColor: _selectedIndex == 2 ? Colors.white : null,
                  ),
                  GButton(
                    icon: _selectedIndex == 3
                        ? Iconsax.setting_2
                        : Iconsax.setting_2,
                    text: S.of(context).profile,
                    iconActiveColor: _selectedIndex == 3 ? Colors.white : null,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
