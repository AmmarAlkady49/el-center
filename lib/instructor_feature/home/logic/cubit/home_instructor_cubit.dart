import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/instructor_feature/home/data/repo/instructor_home_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../data/model/course_info_model_with_student_count_and_completion_rate_model.dart';
import 'home_instructor_state.dart';

class HomeInstructorCubit extends Cubit<HomeInstructorState> {
  final InstructorHomeRepo homeInstructorRepo;
  HomeInstructorCubit(this.homeInstructorRepo)
      : super(HomeInstructorState.initial());

  late int totalCourses;
  int totalStudents = 0;
  double avgCompletionRate = 0;
  double avgRating = 0;
  List<CourseInfoModelWithStudentCountAndCompletionRateModel>
      courseInfoModelWithStudentCountAndCompletionRateModel = [];

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController durationController;
  late TextEditingController requirementsController;

  String? selectedCategory;
  int? selectedCategoryId;
  String? selectedLanguage;

  bool isPublished = false;
  bool isAIAssistantEnabled = false;

  File? selectedImage;
  String? selectedImageUrl;
  final ImagePicker picker = ImagePicker();

  void emitHomeInstructorState() async {
    emit(HomeInstructorState.homeIstructorLoading());
    try {
      final profileData = await homeInstructorRepo.getProfile();
      final getAllApprovedInstructorCourses = await homeInstructorRepo
          .getAllApprovedInstructorCourses(profileData.id);

      totalCourses = getAllApprovedInstructorCourses.length;
      totalStudents = 0;
      avgRating = 0;
      avgCompletionRate = 0;
      courseInfoModelWithStudentCountAndCompletionRateModel.clear();

      double totalRatingSum = 0;
      int ratingCount = 0;

      for (CourseInfoModel course in getAllApprovedInstructorCourses) {
        final studentCount =
            await homeInstructorRepo.getStudentsCount(course.id);
        totalStudents += studentCount;

        // Handle rating safely
        if (course.rating != null && course.rating! > 0) {
          totalRatingSum += course.rating!;
          ratingCount++;
        }

        final enrollments =
            await homeInstructorRepo.getCourseEnrollments(course.id);

        int completedCount = enrollments.where((e) => e.progress == 100).length;

        double completionRateByCourse =
            enrollments.isNotEmpty ? completedCount / enrollments.length : 0;

        avgCompletionRate += completionRateByCourse;

        courseInfoModelWithStudentCountAndCompletionRateModel.add(
          CourseInfoModelWithStudentCountAndCompletionRateModel(
            courseInfoModel: course,
            studentCount: studentCount,
            completionRate: completionRateByCourse,
          ),
        );
      }

      // Calculate average rating (only if we have ratings)
      avgRating = ratingCount > 0 ? totalRatingSum / ratingCount : 0;
      avgCompletionRate =
          totalCourses > 0 ? avgCompletionRate / totalCourses : 0;

      emit(HomeInstructorState.homeIstructorSuccess(
        profileDate: profileData,
        totalCourses: totalCourses,
        totalStudents: totalStudents,
        avgCompletionRate: avgCompletionRate,
        avgRating: avgRating,
        courseInfoModelWithStudentCountAndCompletionRateModel:
            courseInfoModelWithStudentCountAndCompletionRateModel,
      ));
    } catch (e) {
      emit(HomeInstructorState.homeIstructorError(error: e.toString()));
    }
  }

  void toggleAIAssistant() {
    isAIAssistantEnabled = !isAIAssistantEnabled;
    emit(HomeInstructorState.toggleAIAssistant(isAIAssistantEnabled));
  }

  void togglePublished() {
    isPublished = !isPublished;
    emit(HomeInstructorState.togglePublished(isPublished));
  }

  void selectCategory(String category, int categoryId) {
    selectedCategory = category;
    selectedCategoryId = categoryId;
    emit(HomeInstructorState.selectCategory(selectedCategory!));
  }

  void selectLanguage(String language) {
    selectedLanguage = language;
    emit(HomeInstructorState.selectLanguage(selectedLanguage!));
  }

  void addCourse() async {
    emit(HomeInstructorState.addCourse());
    try {
      String ext = selectedImage!.path.split('.').last.toLowerCase();
      String mimeType = (ext == 'png') ? 'png' : 'jpeg';
      final thumbnailFile = await MultipartFile.fromFile(
        selectedImage!.path,
        filename: selectedImage!.path.split('/').last,
        contentType: MediaType('image', mimeType),
      );

      final response = await homeInstructorRepo.addCourse(
        title: titleController.text,
        description: descriptionController.text,
        requirements: requirementsController.text,
        price: double.parse(priceController.text),
        thumbnailFile: thumbnailFile,
        isActive: isPublished,
        durationInHours: int.parse(durationController.text),
        categoryId: selectedCategoryId ?? 1,
        useAIAssistant: isAIAssistantEnabled,
        courseLanguage: selectedLanguage ?? 'English',
      );

      log("response: ${response.message}");
      emit(HomeInstructorState.addCourseSuccess(message: response.message));
    } catch (error) {
      log("error: ${error.toString()}");
      emit(HomeInstructorState.addCourseError(error: error.toString()));
    }
  }

  void enitEditCourseCubit(CourseInfoModel courseInfoModel) {
    titleController = TextEditingController(text: courseInfoModel.title);
    descriptionController =
        TextEditingController(text: courseInfoModel.description);
    requirementsController =
        TextEditingController(text: courseInfoModel.requirements);
    priceController =
        TextEditingController(text: courseInfoModel.price.toString());
    durationController =
        TextEditingController(text: courseInfoModel.durationInHours.toString());
    isPublished = courseInfoModel.isActive ?? false;
    isAIAssistantEnabled = courseInfoModel.useAIAssistant ?? false;
    selectedCategory = courseInfoModel.categoryName ?? 'Web Development';
    selectedLanguage = courseInfoModel.courseLanguage;

    // Handle image properly
    if (courseInfoModel.thumbnail != null &&
        courseInfoModel.thumbnail!.isNotEmpty) {
      selectedImage = null; // no local file yet
      selectedImageUrl =
          "${ApiConstants.baseUrlOfTheImage}${courseInfoModel.thumbnail!}";
    } else {
      selectedImage = null;
      selectedImageUrl = null;
    }
  }

  void updateCourse(CourseInfoModel courseInfoModel) async {
    // Validate numeric fields
    double? price;
    int? duration;

    try {
      price = double.parse(priceController.text.trim());
    } catch (_) {
      emit(HomeInstructorState.updateCourseError(
        error: 'Invalid price. Please enter a valid number.',
      ));
      return;
    }

    try {
      duration = int.parse(durationController.text.trim());
    } catch (_) {
      emit(HomeInstructorState.updateCourseError(
        error: 'Invalid duration. Please enter a valid number.',
      ));
      return;
    }

    emit(HomeInstructorState.updateCourse());

    try {
      MultipartFile? thumbnailFile;

      // Only prepare new image if selected
      if (selectedImage != null) {
        String ext = selectedImage!.path.split('.').last.toLowerCase();
        String mimeType = (ext == 'png') ? 'png' : 'jpeg';
        thumbnailFile = await MultipartFile.fromFile(
          selectedImage!.path,
          filename: selectedImage!.path.split('/').last,
          contentType: MediaType('image', mimeType),
        );
      }

      await homeInstructorRepo.updateCourse(
        id: courseInfoModel.id,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        requirements: requirementsController.text.trim(),
        price: price,
        thumbnailFile: thumbnailFile, // null means keep the existing one
        isActive: isPublished,
        durationInHours: duration,
        categoryId: selectedCategoryId ?? 1,
        useAIAssistant: isAIAssistantEnabled,
        courseLanguage: selectedLanguage ?? 'English',
      );

      emit(HomeInstructorState.updateCourseSuccess(
          message: 'Course updated successfully.'));
    } catch (error) {
      emit(HomeInstructorState.updateCourseError(
        error: 'Failed to update course: ${error.toString()}',
      ));
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    durationController.dispose();
    requirementsController.dispose();

    return super.close();
  }

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Web Development',
      'icon': Iconsax.code_1,
      'color': const Color(0xFF2196F3),
      "categoryId": 1
    },
    {
      'name': 'Mobile App Development',
      'icon': Iconsax.mobile,
      'color': const Color(0xFF4CAF50),
      "categoryId": 2
    },
    {
      'name': 'Ai & Machine Learning',
      'icon': Iconsax.cpu,
      'color': const Color(0xFF9C27B0),
      "categoryId": 3
    },
    {
      'name': 'Game Development',
      'icon': Iconsax.game,
      'color': const Color(0xFFFF5722),
      "categoryId": 4
    },
    {
      'name': 'Cybersecurity',
      'icon': Iconsax.shield_tick,
      'color': const Color(0xFFE91E63),
      "categoryId": 5
    },
    {
      'name': 'Data Science',
      'icon': Iconsax.chart_21,
      'color': const Color(0xFF00BCD4),
      "categoryId": 6
    },
  ];

  final List<Map<String, dynamic>> languages = [
    {'name': 'English', 'flag': '🇺🇸', 'native': 'English'},
    {'name': 'Spanish', 'flag': '🇪🇸', 'native': 'Español'},
    {'name': 'French', 'flag': '🇫🇷', 'native': 'Français'},
    {'name': 'German', 'flag': '🇩🇪', 'native': 'Deutsch'},
    {'name': 'Italian', 'flag': '🇮🇹', 'native': 'Italiano'},
    {'name': 'Portuguese', 'flag': '🇵🇹', 'native': 'Português'},
    {'name': 'Chinese', 'flag': '🇨🇳', 'native': '中文'},
    {'name': 'Japanese', 'flag': '🇯🇵', 'native': '日本語'},
    {'name': 'Korean', 'flag': '🇰🇷', 'native': '한국어'},
    {'name': 'Arabic', 'flag': '🇸🇦', 'native': 'العربية'},
  ];
}
