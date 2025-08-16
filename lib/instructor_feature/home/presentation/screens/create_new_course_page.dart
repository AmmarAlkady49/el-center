import 'package:e_learning_app/core/helpers/helper_dialogs.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:e_learning_app/instructor_feature/home/presentation/widgets/modern_image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_instructor_state.dart';
import '../widgets/build_selection_field.dart';
import '../widgets/build_switch_container.dart';
import '../widgets/build_text_field_with_lable.dart';

class CreateNewCoursePage extends StatefulWidget {
  final HomeInstructorCubit cubit;
  const CreateNewCoursePage({super.key, required this.cubit});

  @override
  State<CreateNewCoursePage> createState() => _CreateNewCoursePageState();
}

class _CreateNewCoursePageState extends State<CreateNewCoursePage> {
  @override
  void dispose() {
    super.dispose();
    widget.cubit.selectedImage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(context, title: S.of(context).create_course),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Title
              BuildTextFieldWithLable(
                label: S.of(context).course_title,
                controller: widget.cubit.titleController,
                hintText: S.of(context).Enter_course_title,
                icon: Iconsax.book_1,
              ),

              // Course Description
              BuildTextFieldWithLable(
                label: S.of(context).description,
                controller: widget.cubit.descriptionController,
                hintText: S
                    .of(context)
                    .describe_what_student_will_learn_in_this_course,
                icon: Iconsax.document_text,
                maxLines: 4,
              ),

              // Category Selection
              BuildSelectionField(
                label: S.of(context).category,
                // selectedValue: widget.cubit.selectedCategory,
                hintText:
                    S.of(context).choose_the_best_category_for_your_course,
                icon: Iconsax.category,
                cubit: widget.cubit,
                // onTap: _showCategoryBottomSheet,
              ),

              // Course Language Selection
              BuildSelectionField(
                label: S.of(context).course_language,
                // selectedValue: widget.cubit.selectedLanguage,
                hintText:
                    S.of(context).select_the_primary_language_for_instruction,
                icon: Iconsax.translate,
                cubit: widget.cubit,
                // onTap: _showLanguageBottomSheet,
              ),

              // Price
              BuildTextFieldWithLable(
                label: S.of(context).price,
                controller: widget.cubit.priceController,
                hintText: S.of(context).enter_course_price,
                icon: Iconsax.tag,
                keyboardType: TextInputType.number,
              ),

              // Duration
              BuildTextFieldWithLable(
                label: S.of(context).duration,
                controller: widget.cubit.durationController,
                hintText: S.of(context).enter_total_course_duration,
                icon: Iconsax.clock,
              ),

              // Course Requirements
              BuildTextFieldWithLable(
                label: S.of(context).course_requirements,
                controller: widget.cubit.requirementsController,
                hintText: S
                    .of(context)
                    .list_prerequisites_or_requirements_for_students,
                icon: Iconsax.task_square,
                maxLines: 3,
              ),

              // Toggle Switches
              BuildSwitchContainer(cubit: widget.cubit),

              // image thumbnail picker
              ModernImagePicker(
                label: S.of(context).thumbnail,
                cubit: widget.cubit,
              ),

              verticalSpacing(20),

              // Create Course Button
              BlocConsumer<HomeInstructorCubit, HomeInstructorState>(
                bloc: widget.cubit,
                buildWhen: (previous, current) =>
                    current is AddCourse ||
                    current is AddCourseSuccess ||
                    current is AddCourseError,
                listener: (context, state) {
                  if (state is AddCourseSuccess) {
                    Navigator.pop(context);
                    return HelperDialogs.showSuccess(state.message, context);
                  } else if (state is AddCourseError) {
                    return HelperDialogs.showError(state.error, context);
                  }
                },
                listenWhen: (previous, current) =>
                    current is AddCourseSuccess || current is AddCourseError,
                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    height: 47.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: state is AddCourse
                            ? [
                                Colors.grey,
                                Colors.grey.withAlpha(190),
                              ]
                            : [
                                AppColors.mainBlue,
                                AppColors.mainBlue.withAlpha(190),
                              ],
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: state is AddCourse
                              ? Colors.grey.withAlpha(60)
                              : AppColors.mainBlue.withAlpha(60),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: state is AddCourse ? null : _createCourse,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state is AddCourse
                                ? CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Iconsax.add_circle,
                                    color: Colors.white,
                                    size: 22.sp,
                                  ),
                            horizontalSpacing(12),
                            Text(
                              state is AddCourse
                                  ? S.of(context).loading
                                  : S.of(context).create_course,
                              style:
                                  FontHelper.font15BlackW600(context).copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              verticalSpacing(32),
            ],
          ),
        ),
      ),
    );
  }

  void _createCourse() {
    // Validate required fields
    if (widget.cubit.titleController.text.isEmpty) {
      HelperDialogs.showError(
        S.of(context).please_enter_course_title,
        context,
      );
      return;
    }

    if (widget.cubit.selectedCategory == null) {
      HelperDialogs.showError(
        S.of(context).please_select_a_category,
        context,
      );
      return;
    }

    if (widget.cubit.selectedLanguage == null) {
      HelperDialogs.showError(
        S.of(context).please_select_a_language,
        context,
      );
      return;
    }
    if (widget.cubit.selectedImage == null) {
      HelperDialogs.showError(
        S.of(context).please_select_a_thumbnail,
        context,
      );
      return;
    }

    widget.cubit.addCourse();
  }
}
