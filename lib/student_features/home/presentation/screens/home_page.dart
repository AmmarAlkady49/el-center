import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/student_features/home/logic/cubit/home_cubit.dart';
import 'package:e_learning_app/student_features/home/presentation/widgets/category_section.dart';
import 'package:e_learning_app/student_features/home/presentation/widgets/popular_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_state.dart';
import '../widgets/build_app_bar_for_home_page.dart';
import '../widgets/build_bar_chart_for_home_page.dart';
import '../widgets/error_state_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen: (previous, current) =>
          current is HomeScreenLoading ||
          current is HomeScreenLoaded ||
          current is HomeScreenLoadedError,
      builder: (context, state) {
        if (state is HomeScreenLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is HomeScreenLoadedError) {
          return ErrorStateWidget(
            errorMessage: state.error,
            customTitle: S.of(context).unable_to_load_content,
            customSubtitle: S.of(context).unable_to_load_content_desc,
            onRetry: () {
              context.read<HomeCubit>().emitHomeScreenForStudent();
            },
          );
        } else if (state is HomeScreenLoaded) {
          return CustomScrollView(
            slivers: [
              BuildAppBarForHomePage(),
              SliverToBoxAdapter(child: verticalSpacing(20)),
              SliverToBoxAdapter(
                  child: ModernBarChartForHomePage(
                weeklyProgressData: state.weeklyProgress,
              )),
              SliverToBoxAdapter(child: verticalSpacing(20)),
              SliverToBoxAdapter(
                  child: PopularProducts(
                courses: state.courses,
              )),
              SliverToBoxAdapter(child: CategorySection()),
              SliverToBoxAdapter(child: verticalSpacing(100)),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
