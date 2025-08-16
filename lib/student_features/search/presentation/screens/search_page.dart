import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/student_features/search/logic/cubit/search_cubit.dart';
import 'package:e_learning_app/student_features/search/presentation/widgets/build_categories_suggestions_widget.dart';
import 'package:e_learning_app/student_features/search/presentation/widgets/build_text_form_field_for_search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/search_state.dart';
import '../widgets/build_searched_courses_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(
        context,
        title: S.of(context).search,
        hasIconLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            // Search Bar
            BuildTextFormFieldForSearchPage(searchCubit: searchCubit),
            // Content Section
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (previous, current) =>
                    current is CourseSearching ||
                    current is CourseSearched ||
                    current is Error ||
                    current is Initial,
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: _buildContent(context, state),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, SearchState state) {
    if (state is CourseSearching) {
      return _buildLoadingState(context);
    } else if (state is Error) {
      return _buildErrorState(context, state.message);
    } else if (state is CourseSearched) {
      return _buildSearchResults(context, state, context.read<SearchCubit>());
    } else {
      return _buildInitialState(context);
    }
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(),
          SizedBox(height: 16.h),
          Text(
            'Searching courses...',
            style: FontHelper.font16BlackW500(context).copyWith(
              color: AppColors.greyBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.red.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline_rounded,
              color: AppColors.red,
              size: 32.w,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Oops! Something went wrong',
            style: FontHelper.font18Black45W300(context),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton.icon(
            onPressed: () {
              final cubit = context.read<SearchCubit>();
              if (cubit.searchQuery.isNotEmpty) {
                cubit.setSearchQuery(cubit.searchQuery, null);
              }
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainBlue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
      BuildContext context, CourseSearched state, SearchCubit searchCubit) {
    if (state.courses.isEmpty) {
      return _buildEmptyResults(context);
    }

    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${S.of(context).found} ${state.courses.length} ${S.of(context).courses}',
                style: FontHelper.font16BlackW600(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GestureDetector(
                  onTap: () {
                    searchCubit.searchController.clear();
                    searchCubit.setSearchQuery('', null);
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue.withAlpha(30),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.greyBlue,
                      size: 16.w,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BuildSearchedCoursesWidget(
              searchCubit: context.read<SearchCubit>(),
              searchedCourses: state.courses,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(35),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              color: AppColors.mainBlue.withAlpha(200),
              size: 48.w,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            S.of(context).no_courses_found,
            style: FontHelper.font20BlackW700(context),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).try_adjusting_your_search,
            style: FontHelper.font15BlackW400(context).copyWith(
              color: AppColors.greyBlue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          _buildSuggestionChips(context),
        ],
      ),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).popular_categories,
            style: FontHelper.font18Black45W300(context).copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).explore_courses_in_trending_categories,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BuildCategoriesSuggestionsWidget(
              searchCubit: context.read<SearchCubit>(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionChips(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: cubit.suggestedCategories.entries.map((entry) {
        final category = entry.key;
        final categoryCode = entry.value;
        return GestureDetector(
          onTap: () => cubit.setSearchQuery(' ', categoryCode),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(30),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColors.mainBlue.withAlpha(80),
              ),
            ),
            child: Text(
              category,
              style: FontHelper.font12lackW400(context).copyWith(
                color: AppColors.mainBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
