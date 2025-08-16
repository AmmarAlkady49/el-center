import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../core/widgets/build_geniric_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_instructor_cubit.dart';
import '../../logic/cubit/home_instructor_state.dart';
import '../widgets/build_selection_field.dart';
import '../widgets/build_switch_container.dart';
import '../widgets/build_text_field_with_lable.dart';
import '../widgets/modern_image_picker.dart';

class EditCoursePage extends StatelessWidget {
  final HomeInstructorCubit cubit;
  final CourseInfoModel courseInfoModel;
  const EditCoursePage(
      {super.key, required this.cubit, required this.courseInfoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(context, title: S.of(context).edit_course),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Title
              BuildTextFieldWithLable(
                label: S.of(context).course_title,
                controller: cubit.titleController,
                hintText: S.of(context).Enter_course_title,
                icon: Iconsax.book_1,
              ),

              // Course Description
              BuildTextFieldWithLable(
                label: S.of(context).description,
                controller: cubit.descriptionController,
                hintText: S
                    .of(context)
                    .describe_what_student_will_learn_in_this_course,
                icon: Iconsax.document_text,
                maxLines: 4,
              ),

              // Category Selection
              BuildSelectionField(
                label: S.of(context).category,
                hintText:
                    S.of(context).choose_the_best_category_for_your_course,
                icon: Iconsax.category,
                cubit: cubit,
              ),

              // Course Language Selection
              BuildSelectionField(
                label: S.of(context).course_language,
                hintText:
                    S.of(context).select_the_primary_language_for_instruction,
                icon: Iconsax.translate,
                cubit: cubit,
              ),

              // Price
              BuildTextFieldWithLable(
                label: S.of(context).price,
                controller: cubit.priceController,
                hintText: S.of(context).enter_course_price,
                icon: Iconsax.tag,
                keyboardType: TextInputType.number,
              ),

              // Duration
              BuildTextFieldWithLable(
                label: S.of(context).duration,
                controller: cubit.durationController,
                hintText: S.of(context).enter_total_course_duration,
                icon: Iconsax.clock,
              ),

              // Course Requirements
              BuildTextFieldWithLable(
                label: S.of(context).course_requirements,
                controller: cubit.requirementsController,
                hintText: S
                    .of(context)
                    .list_prerequisites_or_requirements_for_students,
                icon: Iconsax.task_square,
                maxLines: 3,
              ),

              // Toggle Switches
              BuildSwitchContainer(cubit: cubit),

              // image thumbnail picker
              ModernImagePicker(
                label: S.of(context).thumbnail,
                cubit: cubit,
              ),

              verticalSpacing(20),

              Row(
                children: [
                  // Update Course Button (Primary)
                  Expanded(
                    child:
                        BlocConsumer<HomeInstructorCubit, HomeInstructorState>(
                      bloc: cubit,
                      buildWhen: (previous, current) =>
                          current is UpdateCourse ||
                          current is UpdateCourseSuccess ||
                          current is UpdateCourseError,
                      listener: (context, state) {
                        if (state is UpdateCourseSuccess) {
                          cubit.emitHomeInstructorState();
                          Navigator.pop(context);
                          return HelperDialogs.showSuccess(
                              state.message, context);
                        } else if (state is UpdateCourseError) {
                          return HelperDialogs.showError(state.error, context);
                        }
                      },
                      listenWhen: (previous, current) =>
                          current is UpdateCourseSuccess ||
                          current is UpdateCourseError,
                      builder: (context, state) {
                        return Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: state is UpdateCourse
                                ? AppColors.mainBlue.withAlpha(170)
                                : AppColors.mainBlue,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.mainBlue.withAlpha(60),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.r),
                              onTap: () => state is UpdateCourse
                                  ? null
                                  : _updateCourse(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state is UpdateCourse
                                        ? SizedBox(
                                            width: 18.w,
                                            height: 18.h,
                                            child: CupertinoActivityIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Icon(
                                            Iconsax.edit,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                    SizedBox(width: 8.w),
                                    Flexible(
                                      child: Text(
                                        state is UpdateCourse
                                            ? S.of(context).loading
                                            : S.of(context).update_course,
                                        style:
                                            FontHelper.font15BlackW600(context)
                                                .copyWith(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  horizontalSpacing(12),

                  // Manage Content Button (Secondary)
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.5,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          // onTap: _manageContent,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.folder_open,
                                  color: Colors.grey[700],
                                  size: 20.sp,
                                ),
                                SizedBox(width: 8.w),
                                Flexible(
                                  child: Text(
                                    S.of(context).manage_content,
                                    style: FontHelper.font14BlackW500(context)
                                        .copyWith(
                                      color: Colors.grey[700],
                                      fontSize: 13.sp,
                                      letterSpacing: -0.2,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacing(32),
            ],
          ),
        ),
      ),
    );
  }

  void _updateCourse(BuildContext context) {
    // Validate required fields
    if (cubit.titleController.text.isEmpty) {
      return HelperDialogs.showError(
        S.of(context).please_enter_course_title,
        context,
      );
    }

    if (cubit.descriptionController.text.isEmpty) {
      return HelperDialogs.showError(
        S.of(context).describe_what_student_will_learn_in_this_course,
        context,
      );
    }

    if (cubit.selectedCategory == null) {
      return HelperDialogs.showError(
        S.of(context).please_select_a_category,
        context,
      );
    }

    if (cubit.selectedLanguage == null) {
      return HelperDialogs.showError(
        S.of(context).please_select_a_language,
        context,
      );
    }
    // if (cubit.selectedImage == null && cubit.selectedImageUrl == null) {
    //   return HelperDialogs.showError(
    //     S.of(context).please_select_a_thumbnail,
    //     context,
    //   );
    // }

    cubit.updateCourse(courseInfoModel);
  }
}
