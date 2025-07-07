import 'package:e_learning_app/features/home/logic/cubit/home_cubit.dart';
import 'package:e_learning_app/features/home/presentation/widgets/home_app_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../login/presentation/widgets/title_sign_of_auth_pages.dart';
import '../../logic/cubit/home_state.dart';

class BuildAppBarForHomePage extends StatelessWidget {
  const BuildAppBarForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is HomeScreenLoading ||
          current is HomeScreenLoaded ||
          current is HomeScreenLoadedError,
      builder: (context, state) {
        if (state is HomeScreenLoading) {
          return CircularProgressIndicator(color: Colors.black45);
        } else if (state is HomeScreenLoaded) {
          return SizedBox(
              width: double.infinity,
              height: 250.h,
              child: HomeAppBarContent(profileData: state.profileData));
        } else if (state is HomeScreenLoadedError) {
          return Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey,
            child: Text(state.error),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
