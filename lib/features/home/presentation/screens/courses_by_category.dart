import 'package:e_learning_app/core/helpers/build_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import '../widgets/build_course_item_by_category.dart';
import '../widgets/build_empty_courses_list.dart';
import '../widgets/build_error_state_in_home_page.dart';

class CoursesByCategory extends StatelessWidget {
  final int categoryId;
  const CoursesByCategory({super.key, required this.categoryId});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is GettingCoursesByCategory ||
          current is CoursesByCategoryLoaded ||
          current is CoursesByCategoryLoadedError,
      builder: (context, state) {
        Widget content;
        PreferredSizeWidget? appBar =
            buildModernAppBar(context: context, basicAppBar: true);

        if (state is GettingCoursesByCategory) {
          content = const Center(child: CupertinoActivityIndicator());
        } else if (state is CoursesByCategoryLoaded) {
          if (state.courses.isEmpty) {
            content = BuildEmptyCoursesList(cubit: cubit);
          } else {
            content = Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: ListView.separated(
                itemCount: state.courses.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return BuildCourseItemByCategory(
                    courseItem: state.courses[index],
                  );
                },
              ),
            );
            appBar = buildModernAppBar(
                context: context,
                categoryName: categoryId == 0
                    ? S.of(context).all_categories
                    : state.courses[0].categoryName!,
                coursesCount: state.courses.length);
          }
        } else if (state is CoursesByCategoryLoadedError) {
          content = BuildErrorStateInHomePage(error: state.error, cubit: cubit);
        } else {
          content = const SizedBox.shrink();
        }

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          appBar: appBar,
          body: content,
        );
      },
    );
  }
}
