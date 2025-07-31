import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/home/presentation/widgets/category_section.dart';
import 'package:e_learning_app/features/home/presentation/widgets/popular_products.dart';
import 'package:flutter/material.dart';

import '../widgets/build_app_bar_for_home_page.dart';
import '../widgets/build_bar_chart_for_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BuildAppBarForHomePage(),
        SliverToBoxAdapter(child: verticalSpacing(20)),
        SliverToBoxAdapter(child: ModernBarChartForHomePage()),
        SliverToBoxAdapter(child: verticalSpacing(20)),
        SliverToBoxAdapter(child: PopularProducts()),
        SliverToBoxAdapter(child: verticalSpacing(20)),
        SliverToBoxAdapter(child: CategorySection()),
        SliverToBoxAdapter(child: verticalSpacing(100)),
      ],
    );
  }
}
