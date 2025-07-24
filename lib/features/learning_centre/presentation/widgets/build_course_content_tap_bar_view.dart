import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_header_of_course_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/learning_centre_cubit.dart';
import '../../logic/cubit/learning_centre_state.dart';
import 'build_section_card_for_course_content.dart';

class BuildCourseContentTapBarView extends StatefulWidget {
  final LearningCentreCubit cubit;
  const BuildCourseContentTapBarView({super.key, required this.cubit});

  @override
  State<BuildCourseContentTapBarView> createState() =>
      _BuildCourseContentTapBarViewState();
}

class _BuildCourseContentTapBarViewState
    extends State<BuildCourseContentTapBarView> {
  @override
  Widget build(BuildContext context) {
    final modulesWithLessons = widget.cubit.modulesWithLessons;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          // Clean header without gradient
          BuildHeaderOfCourseContent(modulesWithLessons: modulesWithLessons),

          // Course sections with clean cards
          BlocBuilder<LearningCentreCubit, LearningCentreState>(
            bloc: widget.cubit,
            buildWhen: (previous, current) =>
                current is ModuleExpandedStateChanged,
            builder: (context, state) {
              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(16.w),
                  physics: const BouncingScrollPhysics(),
                  itemCount: modulesWithLessons.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => verticalSpacing(12),
                  itemBuilder: (context, index) {
                    final moduleWithLessons = modulesWithLessons[index];
                    final isExpanded =
                        widget.cubit.expandedModules.contains(index);

                    return BuildSectionCardForCourseContent(
                      module: moduleWithLessons.courseModules,
                      lessons: moduleWithLessons.lessons,
                      moduleIndex: index,
                      isExpanded: isExpanded,
                      cubit: widget.cubit,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
