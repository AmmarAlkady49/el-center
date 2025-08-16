import 'dart:developer';

import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/student_features/search/data/repo/search_repo.dart';
import 'package:e_learning_app/student_features/search/logic/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/search_request_model.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchState.initial());

  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  int categoryCode = 0;
  bool isSearching = false;
  bool isTyping = false;
  Map<String, int> suggestedCategories = {
    'Data Science': 6,
    'Web Development': 1,
    'Mobile App Development': 2,
    'Cybersecurity': 5,
  };

  void setSearchQuery(String query, int? categoryCode) async {
    emit(SearchState.courseSearching());
    try {
      searchQuery = query;
      isSearching = query.isNotEmpty;
      this.categoryCode = categoryCode ?? 0;

      if (query.isEmpty) {
        emit(SearchState.initial());
      } else {
        final result = await searchRepo.searchForCourses(SearchRequestModel(
          search: query,
          categoryId: categoryCode,
        ));
        log(result.toString());
        if (result is Success<List<CourseInfoModel>>) {
          emit(SearchState.courseSearched(courses: result.data));
        } else if (result is Failure<List<CourseInfoModel>>) {
          emit(SearchState.error(message: result.error.apiErrorModel.message!));
        }
      }
    } catch (e) {
      log(e.toString());
      emit(SearchState.error(message: e.toString()));
    }
  }

  // void performSearch(String query) {
  //   searchQuery = query;
  //   isSearching = query.isNotEmpty;

  //   if (query.isEmpty) {
  //     // _filteredCourses = _allCourses;
  //   } else {
  //     // _filteredInstructors = _allInstructors
  //     //     .where((instructor) =>
  //     //         instructor.name.toLowerCase().contains(query.toLowerCase()) ||
  //     //         instructor.expertise.toLowerCase().contains(query.toLowerCase()))
  //     //     .toList();

  //     // _filteredCourses = _allCourses
  //     //     .where((course) =>
  //     //         course.title.toLowerCase().contains(query.toLowerCase()) ||
  //     //         course.instructor.toLowerCase().contains(query.toLowerCase()))
  //     //     .toList();
  //   }
  // }
}
