import 'dart:developer';

import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/home/presentation/widgets/category_section.dart';
import 'package:e_learning_app/features/home/presentation/widgets/popular_products.dart';
import 'package:flutter/material.dart';

import '../widgets/build_app_bar_for_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    log('initState');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BuildAppBarForHomePage(),
        SliverToBoxAdapter(child: verticalSpacing(20)),
        SliverToBoxAdapter(child: PopularProducts()),
        // SliverToBoxAdapter(child: verticalSpacing(10)),
        SliverToBoxAdapter(child: CategorySection()),
        SliverToBoxAdapter(child: verticalSpacing(100)),
      ],
    );
  }
}
