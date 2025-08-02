// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_centre_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningCentreState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LearningCentreState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>()';
  }
}

/// @nodoc
class $LearningCentreStateCopyWith<T, $Res> {
  $LearningCentreStateCopyWith(
      LearningCentreState<T> _, $Res Function(LearningCentreState<T>) __);
}

/// Adds pattern-matching-related methods to [LearningCentreState].
extension LearningCentreStatePatterns<T> on LearningCentreState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SelectedContentOfTheCourse<T> value)?
        selectedContentOfTheCourse,
    TResult Function(GettingQuizzesByCourse<T> value)? gettingQuizzesByCourse,
    TResult Function(SuccessGettingQuizzesByCourse<T> value)?
        successGettingQuizzesByCourse,
    TResult Function(FaieldGettingQuizzedByCourse<T> value)?
        faieldGettingQuizzedByCourse,
    TResult Function(LoadingVideo<T> value)? loadingVideo,
    TResult Function(ModuleExpandedStateChanged<T> value)?
        moduleExpandedStateChanged,
    TResult Function(VideoLoaded<T> value)? videoLoaded,
    TResult Function(VideoLoadFailed<T> value)? videoLoadFailed,
    TResult Function(SuccessCompleteLesson<T> value)? successCompleteLesson,
    TResult Function(FailedCompleteLesson<T> value)? failedCompleteLesson,
    TResult Function(LoadingCompletedLessons<T> value)? loadingCompletedLessons,
    TResult Function(SuccessGetCompletedLessons<T> value)?
        successGetCompletedLessons,
    TResult Function(LoadingTextContent<T> value)? loadingTextContent,
    TResult Function(SuccessTextContent<T> value)? successTextContent,
    TResult Function(FailedTextContent<T> value)? failedTextContent,
    TResult Function(FailedGetCompletedLessons<T> value)?
        failedGetCompletedLessons,
    TResult Function(LoadingCourseContent<T> value)? loadingCourseContent,
    TResult Function(SuccessGetCourseContent<T> value)? successGetCourseContent,
    TResult Function(FailedGetCourseContent<T> value)? failedGetCourseContent,
    TResult Function(LessonSelected<T> value)? lessonSelected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case SelectedContentOfTheCourse() when selectedContentOfTheCourse != null:
        return selectedContentOfTheCourse(_that);
      case GettingQuizzesByCourse() when gettingQuizzesByCourse != null:
        return gettingQuizzesByCourse(_that);
      case SuccessGettingQuizzesByCourse()
          when successGettingQuizzesByCourse != null:
        return successGettingQuizzesByCourse(_that);
      case FaieldGettingQuizzedByCourse()
          when faieldGettingQuizzedByCourse != null:
        return faieldGettingQuizzedByCourse(_that);
      case LoadingVideo() when loadingVideo != null:
        return loadingVideo(_that);
      case ModuleExpandedStateChanged() when moduleExpandedStateChanged != null:
        return moduleExpandedStateChanged(_that);
      case VideoLoaded() when videoLoaded != null:
        return videoLoaded(_that);
      case VideoLoadFailed() when videoLoadFailed != null:
        return videoLoadFailed(_that);
      case SuccessCompleteLesson() when successCompleteLesson != null:
        return successCompleteLesson(_that);
      case FailedCompleteLesson() when failedCompleteLesson != null:
        return failedCompleteLesson(_that);
      case LoadingCompletedLessons() when loadingCompletedLessons != null:
        return loadingCompletedLessons(_that);
      case SuccessGetCompletedLessons() when successGetCompletedLessons != null:
        return successGetCompletedLessons(_that);
      case LoadingTextContent() when loadingTextContent != null:
        return loadingTextContent(_that);
      case SuccessTextContent() when successTextContent != null:
        return successTextContent(_that);
      case FailedTextContent() when failedTextContent != null:
        return failedTextContent(_that);
      case FailedGetCompletedLessons() when failedGetCompletedLessons != null:
        return failedGetCompletedLessons(_that);
      case LoadingCourseContent() when loadingCourseContent != null:
        return loadingCourseContent(_that);
      case SuccessGetCourseContent() when successGetCourseContent != null:
        return successGetCourseContent(_that);
      case FailedGetCourseContent() when failedGetCourseContent != null:
        return failedGetCourseContent(_that);
      case LessonSelected() when lessonSelected != null:
        return lessonSelected(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SelectedContentOfTheCourse<T> value)
        selectedContentOfTheCourse,
    required TResult Function(GettingQuizzesByCourse<T> value)
        gettingQuizzesByCourse,
    required TResult Function(SuccessGettingQuizzesByCourse<T> value)
        successGettingQuizzesByCourse,
    required TResult Function(FaieldGettingQuizzedByCourse<T> value)
        faieldGettingQuizzedByCourse,
    required TResult Function(LoadingVideo<T> value) loadingVideo,
    required TResult Function(ModuleExpandedStateChanged<T> value)
        moduleExpandedStateChanged,
    required TResult Function(VideoLoaded<T> value) videoLoaded,
    required TResult Function(VideoLoadFailed<T> value) videoLoadFailed,
    required TResult Function(SuccessCompleteLesson<T> value)
        successCompleteLesson,
    required TResult Function(FailedCompleteLesson<T> value)
        failedCompleteLesson,
    required TResult Function(LoadingCompletedLessons<T> value)
        loadingCompletedLessons,
    required TResult Function(SuccessGetCompletedLessons<T> value)
        successGetCompletedLessons,
    required TResult Function(LoadingTextContent<T> value) loadingTextContent,
    required TResult Function(SuccessTextContent<T> value) successTextContent,
    required TResult Function(FailedTextContent<T> value) failedTextContent,
    required TResult Function(FailedGetCompletedLessons<T> value)
        failedGetCompletedLessons,
    required TResult Function(LoadingCourseContent<T> value)
        loadingCourseContent,
    required TResult Function(SuccessGetCourseContent<T> value)
        successGetCourseContent,
    required TResult Function(FailedGetCourseContent<T> value)
        failedGetCourseContent,
    required TResult Function(LessonSelected<T> value) lessonSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case SelectedContentOfTheCourse():
        return selectedContentOfTheCourse(_that);
      case GettingQuizzesByCourse():
        return gettingQuizzesByCourse(_that);
      case SuccessGettingQuizzesByCourse():
        return successGettingQuizzesByCourse(_that);
      case FaieldGettingQuizzedByCourse():
        return faieldGettingQuizzedByCourse(_that);
      case LoadingVideo():
        return loadingVideo(_that);
      case ModuleExpandedStateChanged():
        return moduleExpandedStateChanged(_that);
      case VideoLoaded():
        return videoLoaded(_that);
      case VideoLoadFailed():
        return videoLoadFailed(_that);
      case SuccessCompleteLesson():
        return successCompleteLesson(_that);
      case FailedCompleteLesson():
        return failedCompleteLesson(_that);
      case LoadingCompletedLessons():
        return loadingCompletedLessons(_that);
      case SuccessGetCompletedLessons():
        return successGetCompletedLessons(_that);
      case LoadingTextContent():
        return loadingTextContent(_that);
      case SuccessTextContent():
        return successTextContent(_that);
      case FailedTextContent():
        return failedTextContent(_that);
      case FailedGetCompletedLessons():
        return failedGetCompletedLessons(_that);
      case LoadingCourseContent():
        return loadingCourseContent(_that);
      case SuccessGetCourseContent():
        return successGetCourseContent(_that);
      case FailedGetCourseContent():
        return failedGetCourseContent(_that);
      case LessonSelected():
        return lessonSelected(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SelectedContentOfTheCourse<T> value)?
        selectedContentOfTheCourse,
    TResult? Function(GettingQuizzesByCourse<T> value)? gettingQuizzesByCourse,
    TResult? Function(SuccessGettingQuizzesByCourse<T> value)?
        successGettingQuizzesByCourse,
    TResult? Function(FaieldGettingQuizzedByCourse<T> value)?
        faieldGettingQuizzedByCourse,
    TResult? Function(LoadingVideo<T> value)? loadingVideo,
    TResult? Function(ModuleExpandedStateChanged<T> value)?
        moduleExpandedStateChanged,
    TResult? Function(VideoLoaded<T> value)? videoLoaded,
    TResult? Function(VideoLoadFailed<T> value)? videoLoadFailed,
    TResult? Function(SuccessCompleteLesson<T> value)? successCompleteLesson,
    TResult? Function(FailedCompleteLesson<T> value)? failedCompleteLesson,
    TResult? Function(LoadingCompletedLessons<T> value)?
        loadingCompletedLessons,
    TResult? Function(SuccessGetCompletedLessons<T> value)?
        successGetCompletedLessons,
    TResult? Function(LoadingTextContent<T> value)? loadingTextContent,
    TResult? Function(SuccessTextContent<T> value)? successTextContent,
    TResult? Function(FailedTextContent<T> value)? failedTextContent,
    TResult? Function(FailedGetCompletedLessons<T> value)?
        failedGetCompletedLessons,
    TResult? Function(LoadingCourseContent<T> value)? loadingCourseContent,
    TResult? Function(SuccessGetCourseContent<T> value)?
        successGetCourseContent,
    TResult? Function(FailedGetCourseContent<T> value)? failedGetCourseContent,
    TResult? Function(LessonSelected<T> value)? lessonSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case SelectedContentOfTheCourse() when selectedContentOfTheCourse != null:
        return selectedContentOfTheCourse(_that);
      case GettingQuizzesByCourse() when gettingQuizzesByCourse != null:
        return gettingQuizzesByCourse(_that);
      case SuccessGettingQuizzesByCourse()
          when successGettingQuizzesByCourse != null:
        return successGettingQuizzesByCourse(_that);
      case FaieldGettingQuizzedByCourse()
          when faieldGettingQuizzedByCourse != null:
        return faieldGettingQuizzedByCourse(_that);
      case LoadingVideo() when loadingVideo != null:
        return loadingVideo(_that);
      case ModuleExpandedStateChanged() when moduleExpandedStateChanged != null:
        return moduleExpandedStateChanged(_that);
      case VideoLoaded() when videoLoaded != null:
        return videoLoaded(_that);
      case VideoLoadFailed() when videoLoadFailed != null:
        return videoLoadFailed(_that);
      case SuccessCompleteLesson() when successCompleteLesson != null:
        return successCompleteLesson(_that);
      case FailedCompleteLesson() when failedCompleteLesson != null:
        return failedCompleteLesson(_that);
      case LoadingCompletedLessons() when loadingCompletedLessons != null:
        return loadingCompletedLessons(_that);
      case SuccessGetCompletedLessons() when successGetCompletedLessons != null:
        return successGetCompletedLessons(_that);
      case LoadingTextContent() when loadingTextContent != null:
        return loadingTextContent(_that);
      case SuccessTextContent() when successTextContent != null:
        return successTextContent(_that);
      case FailedTextContent() when failedTextContent != null:
        return failedTextContent(_that);
      case FailedGetCompletedLessons() when failedGetCompletedLessons != null:
        return failedGetCompletedLessons(_that);
      case LoadingCourseContent() when loadingCourseContent != null:
        return loadingCourseContent(_that);
      case SuccessGetCourseContent() when successGetCourseContent != null:
        return successGetCourseContent(_that);
      case FailedGetCourseContent() when failedGetCourseContent != null:
        return failedGetCourseContent(_that);
      case LessonSelected() when lessonSelected != null:
        return lessonSelected(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CourseInfoModel courseInfo, LessonModule lesson,
            List<CourseModulesWithLessons> modulesWithLessons)?
        selectedContentOfTheCourse,
    TResult Function()? gettingQuizzesByCourse,
    TResult Function(List<QuizModel> quizzes)? successGettingQuizzesByCourse,
    TResult Function(String error)? faieldGettingQuizzedByCourse,
    TResult Function()? loadingVideo,
    TResult Function()? moduleExpandedStateChanged,
    TResult Function(VideoPlayerController videoPlayerController,
            ChewieController chewieController)?
        videoLoaded,
    TResult Function(String error)? videoLoadFailed,
    TResult Function(int lessonId)? successCompleteLesson,
    TResult Function(String error)? failedCompleteLesson,
    TResult Function()? loadingCompletedLessons,
    TResult Function(Set<int> completedLessonIds)? successGetCompletedLessons,
    TResult Function()? loadingTextContent,
    TResult Function()? successTextContent,
    TResult Function()? failedTextContent,
    TResult Function(String error)? failedGetCompletedLessons,
    TResult Function()? loadingCourseContent,
    TResult Function(CourseInfoModel courseInfo,
            List<CourseModulesWithLessons> modulesWithLessons)?
        successGetCourseContent,
    TResult Function(String error)? failedGetCourseContent,
    TResult Function()? lessonSelected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case SelectedContentOfTheCourse() when selectedContentOfTheCourse != null:
        return selectedContentOfTheCourse(
            _that.courseInfo, _that.lesson, _that.modulesWithLessons);
      case GettingQuizzesByCourse() when gettingQuizzesByCourse != null:
        return gettingQuizzesByCourse();
      case SuccessGettingQuizzesByCourse()
          when successGettingQuizzesByCourse != null:
        return successGettingQuizzesByCourse(_that.quizzes);
      case FaieldGettingQuizzedByCourse()
          when faieldGettingQuizzedByCourse != null:
        return faieldGettingQuizzedByCourse(_that.error);
      case LoadingVideo() when loadingVideo != null:
        return loadingVideo();
      case ModuleExpandedStateChanged() when moduleExpandedStateChanged != null:
        return moduleExpandedStateChanged();
      case VideoLoaded() when videoLoaded != null:
        return videoLoaded(_that.videoPlayerController, _that.chewieController);
      case VideoLoadFailed() when videoLoadFailed != null:
        return videoLoadFailed(_that.error);
      case SuccessCompleteLesson() when successCompleteLesson != null:
        return successCompleteLesson(_that.lessonId);
      case FailedCompleteLesson() when failedCompleteLesson != null:
        return failedCompleteLesson(_that.error);
      case LoadingCompletedLessons() when loadingCompletedLessons != null:
        return loadingCompletedLessons();
      case SuccessGetCompletedLessons() when successGetCompletedLessons != null:
        return successGetCompletedLessons(_that.completedLessonIds);
      case LoadingTextContent() when loadingTextContent != null:
        return loadingTextContent();
      case SuccessTextContent() when successTextContent != null:
        return successTextContent();
      case FailedTextContent() when failedTextContent != null:
        return failedTextContent();
      case FailedGetCompletedLessons() when failedGetCompletedLessons != null:
        return failedGetCompletedLessons(_that.error);
      case LoadingCourseContent() when loadingCourseContent != null:
        return loadingCourseContent();
      case SuccessGetCourseContent() when successGetCourseContent != null:
        return successGetCourseContent(
            _that.courseInfo, _that.modulesWithLessons);
      case FailedGetCourseContent() when failedGetCourseContent != null:
        return failedGetCourseContent(_that.error);
      case LessonSelected() when lessonSelected != null:
        return lessonSelected();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CourseInfoModel courseInfo, LessonModule lesson,
            List<CourseModulesWithLessons> modulesWithLessons)
        selectedContentOfTheCourse,
    required TResult Function() gettingQuizzesByCourse,
    required TResult Function(List<QuizModel> quizzes)
        successGettingQuizzesByCourse,
    required TResult Function(String error) faieldGettingQuizzedByCourse,
    required TResult Function() loadingVideo,
    required TResult Function() moduleExpandedStateChanged,
    required TResult Function(VideoPlayerController videoPlayerController,
            ChewieController chewieController)
        videoLoaded,
    required TResult Function(String error) videoLoadFailed,
    required TResult Function(int lessonId) successCompleteLesson,
    required TResult Function(String error) failedCompleteLesson,
    required TResult Function() loadingCompletedLessons,
    required TResult Function(Set<int> completedLessonIds)
        successGetCompletedLessons,
    required TResult Function() loadingTextContent,
    required TResult Function() successTextContent,
    required TResult Function() failedTextContent,
    required TResult Function(String error) failedGetCompletedLessons,
    required TResult Function() loadingCourseContent,
    required TResult Function(CourseInfoModel courseInfo,
            List<CourseModulesWithLessons> modulesWithLessons)
        successGetCourseContent,
    required TResult Function(String error) failedGetCourseContent,
    required TResult Function() lessonSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case SelectedContentOfTheCourse():
        return selectedContentOfTheCourse(
            _that.courseInfo, _that.lesson, _that.modulesWithLessons);
      case GettingQuizzesByCourse():
        return gettingQuizzesByCourse();
      case SuccessGettingQuizzesByCourse():
        return successGettingQuizzesByCourse(_that.quizzes);
      case FaieldGettingQuizzedByCourse():
        return faieldGettingQuizzedByCourse(_that.error);
      case LoadingVideo():
        return loadingVideo();
      case ModuleExpandedStateChanged():
        return moduleExpandedStateChanged();
      case VideoLoaded():
        return videoLoaded(_that.videoPlayerController, _that.chewieController);
      case VideoLoadFailed():
        return videoLoadFailed(_that.error);
      case SuccessCompleteLesson():
        return successCompleteLesson(_that.lessonId);
      case FailedCompleteLesson():
        return failedCompleteLesson(_that.error);
      case LoadingCompletedLessons():
        return loadingCompletedLessons();
      case SuccessGetCompletedLessons():
        return successGetCompletedLessons(_that.completedLessonIds);
      case LoadingTextContent():
        return loadingTextContent();
      case SuccessTextContent():
        return successTextContent();
      case FailedTextContent():
        return failedTextContent();
      case FailedGetCompletedLessons():
        return failedGetCompletedLessons(_that.error);
      case LoadingCourseContent():
        return loadingCourseContent();
      case SuccessGetCourseContent():
        return successGetCourseContent(
            _that.courseInfo, _that.modulesWithLessons);
      case FailedGetCourseContent():
        return failedGetCourseContent(_that.error);
      case LessonSelected():
        return lessonSelected();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CourseInfoModel courseInfo, LessonModule lesson,
            List<CourseModulesWithLessons> modulesWithLessons)?
        selectedContentOfTheCourse,
    TResult? Function()? gettingQuizzesByCourse,
    TResult? Function(List<QuizModel> quizzes)? successGettingQuizzesByCourse,
    TResult? Function(String error)? faieldGettingQuizzedByCourse,
    TResult? Function()? loadingVideo,
    TResult? Function()? moduleExpandedStateChanged,
    TResult? Function(VideoPlayerController videoPlayerController,
            ChewieController chewieController)?
        videoLoaded,
    TResult? Function(String error)? videoLoadFailed,
    TResult? Function(int lessonId)? successCompleteLesson,
    TResult? Function(String error)? failedCompleteLesson,
    TResult? Function()? loadingCompletedLessons,
    TResult? Function(Set<int> completedLessonIds)? successGetCompletedLessons,
    TResult? Function()? loadingTextContent,
    TResult? Function()? successTextContent,
    TResult? Function()? failedTextContent,
    TResult? Function(String error)? failedGetCompletedLessons,
    TResult? Function()? loadingCourseContent,
    TResult? Function(CourseInfoModel courseInfo,
            List<CourseModulesWithLessons> modulesWithLessons)?
        successGetCourseContent,
    TResult? Function(String error)? failedGetCourseContent,
    TResult? Function()? lessonSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case SelectedContentOfTheCourse() when selectedContentOfTheCourse != null:
        return selectedContentOfTheCourse(
            _that.courseInfo, _that.lesson, _that.modulesWithLessons);
      case GettingQuizzesByCourse() when gettingQuizzesByCourse != null:
        return gettingQuizzesByCourse();
      case SuccessGettingQuizzesByCourse()
          when successGettingQuizzesByCourse != null:
        return successGettingQuizzesByCourse(_that.quizzes);
      case FaieldGettingQuizzedByCourse()
          when faieldGettingQuizzedByCourse != null:
        return faieldGettingQuizzedByCourse(_that.error);
      case LoadingVideo() when loadingVideo != null:
        return loadingVideo();
      case ModuleExpandedStateChanged() when moduleExpandedStateChanged != null:
        return moduleExpandedStateChanged();
      case VideoLoaded() when videoLoaded != null:
        return videoLoaded(_that.videoPlayerController, _that.chewieController);
      case VideoLoadFailed() when videoLoadFailed != null:
        return videoLoadFailed(_that.error);
      case SuccessCompleteLesson() when successCompleteLesson != null:
        return successCompleteLesson(_that.lessonId);
      case FailedCompleteLesson() when failedCompleteLesson != null:
        return failedCompleteLesson(_that.error);
      case LoadingCompletedLessons() when loadingCompletedLessons != null:
        return loadingCompletedLessons();
      case SuccessGetCompletedLessons() when successGetCompletedLessons != null:
        return successGetCompletedLessons(_that.completedLessonIds);
      case LoadingTextContent() when loadingTextContent != null:
        return loadingTextContent();
      case SuccessTextContent() when successTextContent != null:
        return successTextContent();
      case FailedTextContent() when failedTextContent != null:
        return failedTextContent();
      case FailedGetCompletedLessons() when failedGetCompletedLessons != null:
        return failedGetCompletedLessons(_that.error);
      case LoadingCourseContent() when loadingCourseContent != null:
        return loadingCourseContent();
      case SuccessGetCourseContent() when successGetCourseContent != null:
        return successGetCourseContent(
            _that.courseInfo, _that.modulesWithLessons);
      case FailedGetCourseContent() when failedGetCourseContent != null:
        return failedGetCourseContent(_that.error);
      case LessonSelected() when lessonSelected != null:
        return lessonSelected();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements LearningCentreState<T> {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.initial()';
  }
}

/// @nodoc

class SelectedContentOfTheCourse<T> implements LearningCentreState<T> {
  const SelectedContentOfTheCourse(
      {required this.courseInfo,
      required this.lesson,
      required final List<CourseModulesWithLessons> modulesWithLessons})
      : _modulesWithLessons = modulesWithLessons;

  final CourseInfoModel courseInfo;
  final LessonModule lesson;
  final List<CourseModulesWithLessons> _modulesWithLessons;
  List<CourseModulesWithLessons> get modulesWithLessons {
    if (_modulesWithLessons is EqualUnmodifiableListView)
      return _modulesWithLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modulesWithLessons);
  }

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedContentOfTheCourseCopyWith<T, SelectedContentOfTheCourse<T>>
      get copyWith => _$SelectedContentOfTheCourseCopyWithImpl<T,
          SelectedContentOfTheCourse<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedContentOfTheCourse<T> &&
            (identical(other.courseInfo, courseInfo) ||
                other.courseInfo == courseInfo) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            const DeepCollectionEquality()
                .equals(other._modulesWithLessons, _modulesWithLessons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseInfo, lesson,
      const DeepCollectionEquality().hash(_modulesWithLessons));

  @override
  String toString() {
    return 'LearningCentreState<$T>.selectedContentOfTheCourse(courseInfo: $courseInfo, lesson: $lesson, modulesWithLessons: $modulesWithLessons)';
  }
}

/// @nodoc
abstract mixin class $SelectedContentOfTheCourseCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $SelectedContentOfTheCourseCopyWith(
          SelectedContentOfTheCourse<T> value,
          $Res Function(SelectedContentOfTheCourse<T>) _then) =
      _$SelectedContentOfTheCourseCopyWithImpl;
  @useResult
  $Res call(
      {CourseInfoModel courseInfo,
      LessonModule lesson,
      List<CourseModulesWithLessons> modulesWithLessons});
}

/// @nodoc
class _$SelectedContentOfTheCourseCopyWithImpl<T, $Res>
    implements $SelectedContentOfTheCourseCopyWith<T, $Res> {
  _$SelectedContentOfTheCourseCopyWithImpl(this._self, this._then);

  final SelectedContentOfTheCourse<T> _self;
  final $Res Function(SelectedContentOfTheCourse<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseInfo = null,
    Object? lesson = null,
    Object? modulesWithLessons = null,
  }) {
    return _then(SelectedContentOfTheCourse<T>(
      courseInfo: null == courseInfo
          ? _self.courseInfo
          : courseInfo // ignore: cast_nullable_to_non_nullable
              as CourseInfoModel,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as LessonModule,
      modulesWithLessons: null == modulesWithLessons
          ? _self._modulesWithLessons
          : modulesWithLessons // ignore: cast_nullable_to_non_nullable
              as List<CourseModulesWithLessons>,
    ));
  }
}

/// @nodoc

class GettingQuizzesByCourse<T> implements LearningCentreState<T> {
  const GettingQuizzesByCourse();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GettingQuizzesByCourse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.gettingQuizzesByCourse()';
  }
}

/// @nodoc

class SuccessGettingQuizzesByCourse<T> implements LearningCentreState<T> {
  const SuccessGettingQuizzesByCourse({required final List<QuizModel> quizzes})
      : _quizzes = quizzes;

  final List<QuizModel> _quizzes;
  List<QuizModel> get quizzes {
    if (_quizzes is EqualUnmodifiableListView) return _quizzes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessGettingQuizzesByCourseCopyWith<T, SuccessGettingQuizzesByCourse<T>>
      get copyWith => _$SuccessGettingQuizzesByCourseCopyWithImpl<T,
          SuccessGettingQuizzesByCourse<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessGettingQuizzesByCourse<T> &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quizzes));

  @override
  String toString() {
    return 'LearningCentreState<$T>.successGettingQuizzesByCourse(quizzes: $quizzes)';
  }
}

/// @nodoc
abstract mixin class $SuccessGettingQuizzesByCourseCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $SuccessGettingQuizzesByCourseCopyWith(
          SuccessGettingQuizzesByCourse<T> value,
          $Res Function(SuccessGettingQuizzesByCourse<T>) _then) =
      _$SuccessGettingQuizzesByCourseCopyWithImpl;
  @useResult
  $Res call({List<QuizModel> quizzes});
}

/// @nodoc
class _$SuccessGettingQuizzesByCourseCopyWithImpl<T, $Res>
    implements $SuccessGettingQuizzesByCourseCopyWith<T, $Res> {
  _$SuccessGettingQuizzesByCourseCopyWithImpl(this._self, this._then);

  final SuccessGettingQuizzesByCourse<T> _self;
  final $Res Function(SuccessGettingQuizzesByCourse<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quizzes = null,
  }) {
    return _then(SuccessGettingQuizzesByCourse<T>(
      quizzes: null == quizzes
          ? _self._quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
    ));
  }
}

/// @nodoc

class FaieldGettingQuizzedByCourse<T> implements LearningCentreState<T> {
  const FaieldGettingQuizzedByCourse({required this.error});

  final String error;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaieldGettingQuizzedByCourseCopyWith<T, FaieldGettingQuizzedByCourse<T>>
      get copyWith => _$FaieldGettingQuizzedByCourseCopyWithImpl<T,
          FaieldGettingQuizzedByCourse<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaieldGettingQuizzedByCourse<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LearningCentreState<$T>.faieldGettingQuizzedByCourse(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FaieldGettingQuizzedByCourseCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $FaieldGettingQuizzedByCourseCopyWith(
          FaieldGettingQuizzedByCourse<T> value,
          $Res Function(FaieldGettingQuizzedByCourse<T>) _then) =
      _$FaieldGettingQuizzedByCourseCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FaieldGettingQuizzedByCourseCopyWithImpl<T, $Res>
    implements $FaieldGettingQuizzedByCourseCopyWith<T, $Res> {
  _$FaieldGettingQuizzedByCourseCopyWithImpl(this._self, this._then);

  final FaieldGettingQuizzedByCourse<T> _self;
  final $Res Function(FaieldGettingQuizzedByCourse<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(FaieldGettingQuizzedByCourse<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadingVideo<T> implements LearningCentreState<T> {
  const LoadingVideo();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingVideo<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.loadingVideo()';
  }
}

/// @nodoc

class ModuleExpandedStateChanged<T> implements LearningCentreState<T> {
  const ModuleExpandedStateChanged();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModuleExpandedStateChanged<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.moduleExpandedStateChanged()';
  }
}

/// @nodoc

class VideoLoaded<T> implements LearningCentreState<T> {
  const VideoLoaded(
      {required this.videoPlayerController, required this.chewieController});

  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoLoadedCopyWith<T, VideoLoaded<T>> get copyWith =>
      _$VideoLoadedCopyWithImpl<T, VideoLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoLoaded<T> &&
            (identical(other.videoPlayerController, videoPlayerController) ||
                other.videoPlayerController == videoPlayerController) &&
            (identical(other.chewieController, chewieController) ||
                other.chewieController == chewieController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, videoPlayerController, chewieController);

  @override
  String toString() {
    return 'LearningCentreState<$T>.videoLoaded(videoPlayerController: $videoPlayerController, chewieController: $chewieController)';
  }
}

/// @nodoc
abstract mixin class $VideoLoadedCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $VideoLoadedCopyWith(
          VideoLoaded<T> value, $Res Function(VideoLoaded<T>) _then) =
      _$VideoLoadedCopyWithImpl;
  @useResult
  $Res call(
      {VideoPlayerController videoPlayerController,
      ChewieController chewieController});
}

/// @nodoc
class _$VideoLoadedCopyWithImpl<T, $Res>
    implements $VideoLoadedCopyWith<T, $Res> {
  _$VideoLoadedCopyWithImpl(this._self, this._then);

  final VideoLoaded<T> _self;
  final $Res Function(VideoLoaded<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoPlayerController = null,
    Object? chewieController = null,
  }) {
    return _then(VideoLoaded<T>(
      videoPlayerController: null == videoPlayerController
          ? _self.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
      chewieController: null == chewieController
          ? _self.chewieController
          : chewieController // ignore: cast_nullable_to_non_nullable
              as ChewieController,
    ));
  }
}

/// @nodoc

class VideoLoadFailed<T> implements LearningCentreState<T> {
  const VideoLoadFailed({required this.error});

  final String error;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoLoadFailedCopyWith<T, VideoLoadFailed<T>> get copyWith =>
      _$VideoLoadFailedCopyWithImpl<T, VideoLoadFailed<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoLoadFailed<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LearningCentreState<$T>.videoLoadFailed(error: $error)';
  }
}

/// @nodoc
abstract mixin class $VideoLoadFailedCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $VideoLoadFailedCopyWith(
          VideoLoadFailed<T> value, $Res Function(VideoLoadFailed<T>) _then) =
      _$VideoLoadFailedCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$VideoLoadFailedCopyWithImpl<T, $Res>
    implements $VideoLoadFailedCopyWith<T, $Res> {
  _$VideoLoadFailedCopyWithImpl(this._self, this._then);

  final VideoLoadFailed<T> _self;
  final $Res Function(VideoLoadFailed<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(VideoLoadFailed<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SuccessCompleteLesson<T> implements LearningCentreState<T> {
  const SuccessCompleteLesson({required this.lessonId});

  final int lessonId;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCompleteLessonCopyWith<T, SuccessCompleteLesson<T>> get copyWith =>
      _$SuccessCompleteLessonCopyWithImpl<T, SuccessCompleteLesson<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessCompleteLesson<T> &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonId);

  @override
  String toString() {
    return 'LearningCentreState<$T>.successCompleteLesson(lessonId: $lessonId)';
  }
}

/// @nodoc
abstract mixin class $SuccessCompleteLessonCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $SuccessCompleteLessonCopyWith(SuccessCompleteLesson<T> value,
          $Res Function(SuccessCompleteLesson<T>) _then) =
      _$SuccessCompleteLessonCopyWithImpl;
  @useResult
  $Res call({int lessonId});
}

/// @nodoc
class _$SuccessCompleteLessonCopyWithImpl<T, $Res>
    implements $SuccessCompleteLessonCopyWith<T, $Res> {
  _$SuccessCompleteLessonCopyWithImpl(this._self, this._then);

  final SuccessCompleteLesson<T> _self;
  final $Res Function(SuccessCompleteLesson<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lessonId = null,
  }) {
    return _then(SuccessCompleteLesson<T>(
      lessonId: null == lessonId
          ? _self.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class FailedCompleteLesson<T> implements LearningCentreState<T> {
  const FailedCompleteLesson({required this.error});

  final String error;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailedCompleteLessonCopyWith<T, FailedCompleteLesson<T>> get copyWith =>
      _$FailedCompleteLessonCopyWithImpl<T, FailedCompleteLesson<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailedCompleteLesson<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LearningCentreState<$T>.failedCompleteLesson(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailedCompleteLessonCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $FailedCompleteLessonCopyWith(FailedCompleteLesson<T> value,
          $Res Function(FailedCompleteLesson<T>) _then) =
      _$FailedCompleteLessonCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailedCompleteLessonCopyWithImpl<T, $Res>
    implements $FailedCompleteLessonCopyWith<T, $Res> {
  _$FailedCompleteLessonCopyWithImpl(this._self, this._then);

  final FailedCompleteLesson<T> _self;
  final $Res Function(FailedCompleteLesson<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(FailedCompleteLesson<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadingCompletedLessons<T> implements LearningCentreState<T> {
  const LoadingCompletedLessons();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingCompletedLessons<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.loadingCompletedLessons()';
  }
}

/// @nodoc

class SuccessGetCompletedLessons<T> implements LearningCentreState<T> {
  const SuccessGetCompletedLessons({required final Set<int> completedLessonIds})
      : _completedLessonIds = completedLessonIds;

  final Set<int> _completedLessonIds;
  Set<int> get completedLessonIds {
    if (_completedLessonIds is EqualUnmodifiableSetView)
      return _completedLessonIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_completedLessonIds);
  }

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessGetCompletedLessonsCopyWith<T, SuccessGetCompletedLessons<T>>
      get copyWith => _$SuccessGetCompletedLessonsCopyWithImpl<T,
          SuccessGetCompletedLessons<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessGetCompletedLessons<T> &&
            const DeepCollectionEquality()
                .equals(other._completedLessonIds, _completedLessonIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_completedLessonIds));

  @override
  String toString() {
    return 'LearningCentreState<$T>.successGetCompletedLessons(completedLessonIds: $completedLessonIds)';
  }
}

/// @nodoc
abstract mixin class $SuccessGetCompletedLessonsCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $SuccessGetCompletedLessonsCopyWith(
          SuccessGetCompletedLessons<T> value,
          $Res Function(SuccessGetCompletedLessons<T>) _then) =
      _$SuccessGetCompletedLessonsCopyWithImpl;
  @useResult
  $Res call({Set<int> completedLessonIds});
}

/// @nodoc
class _$SuccessGetCompletedLessonsCopyWithImpl<T, $Res>
    implements $SuccessGetCompletedLessonsCopyWith<T, $Res> {
  _$SuccessGetCompletedLessonsCopyWithImpl(this._self, this._then);

  final SuccessGetCompletedLessons<T> _self;
  final $Res Function(SuccessGetCompletedLessons<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? completedLessonIds = null,
  }) {
    return _then(SuccessGetCompletedLessons<T>(
      completedLessonIds: null == completedLessonIds
          ? _self._completedLessonIds
          : completedLessonIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class LoadingTextContent<T> implements LearningCentreState<T> {
  const LoadingTextContent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingTextContent<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.loadingTextContent()';
  }
}

/// @nodoc

class SuccessTextContent<T> implements LearningCentreState<T> {
  const SuccessTextContent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SuccessTextContent<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.successTextContent()';
  }
}

/// @nodoc

class FailedTextContent<T> implements LearningCentreState<T> {
  const FailedTextContent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FailedTextContent<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.failedTextContent()';
  }
}

/// @nodoc

class FailedGetCompletedLessons<T> implements LearningCentreState<T> {
  const FailedGetCompletedLessons({required this.error});

  final String error;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailedGetCompletedLessonsCopyWith<T, FailedGetCompletedLessons<T>>
      get copyWith => _$FailedGetCompletedLessonsCopyWithImpl<T,
          FailedGetCompletedLessons<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailedGetCompletedLessons<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LearningCentreState<$T>.failedGetCompletedLessons(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailedGetCompletedLessonsCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $FailedGetCompletedLessonsCopyWith(FailedGetCompletedLessons<T> value,
          $Res Function(FailedGetCompletedLessons<T>) _then) =
      _$FailedGetCompletedLessonsCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailedGetCompletedLessonsCopyWithImpl<T, $Res>
    implements $FailedGetCompletedLessonsCopyWith<T, $Res> {
  _$FailedGetCompletedLessonsCopyWithImpl(this._self, this._then);

  final FailedGetCompletedLessons<T> _self;
  final $Res Function(FailedGetCompletedLessons<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(FailedGetCompletedLessons<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadingCourseContent<T> implements LearningCentreState<T> {
  const LoadingCourseContent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingCourseContent<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.loadingCourseContent()';
  }
}

/// @nodoc

class SuccessGetCourseContent<T> implements LearningCentreState<T> {
  const SuccessGetCourseContent(
      {required this.courseInfo,
      required final List<CourseModulesWithLessons> modulesWithLessons})
      : _modulesWithLessons = modulesWithLessons;

  final CourseInfoModel courseInfo;
  final List<CourseModulesWithLessons> _modulesWithLessons;
  List<CourseModulesWithLessons> get modulesWithLessons {
    if (_modulesWithLessons is EqualUnmodifiableListView)
      return _modulesWithLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modulesWithLessons);
  }

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessGetCourseContentCopyWith<T, SuccessGetCourseContent<T>>
      get copyWith =>
          _$SuccessGetCourseContentCopyWithImpl<T, SuccessGetCourseContent<T>>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessGetCourseContent<T> &&
            (identical(other.courseInfo, courseInfo) ||
                other.courseInfo == courseInfo) &&
            const DeepCollectionEquality()
                .equals(other._modulesWithLessons, _modulesWithLessons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseInfo,
      const DeepCollectionEquality().hash(_modulesWithLessons));

  @override
  String toString() {
    return 'LearningCentreState<$T>.successGetCourseContent(courseInfo: $courseInfo, modulesWithLessons: $modulesWithLessons)';
  }
}

/// @nodoc
abstract mixin class $SuccessGetCourseContentCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $SuccessGetCourseContentCopyWith(SuccessGetCourseContent<T> value,
          $Res Function(SuccessGetCourseContent<T>) _then) =
      _$SuccessGetCourseContentCopyWithImpl;
  @useResult
  $Res call(
      {CourseInfoModel courseInfo,
      List<CourseModulesWithLessons> modulesWithLessons});
}

/// @nodoc
class _$SuccessGetCourseContentCopyWithImpl<T, $Res>
    implements $SuccessGetCourseContentCopyWith<T, $Res> {
  _$SuccessGetCourseContentCopyWithImpl(this._self, this._then);

  final SuccessGetCourseContent<T> _self;
  final $Res Function(SuccessGetCourseContent<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseInfo = null,
    Object? modulesWithLessons = null,
  }) {
    return _then(SuccessGetCourseContent<T>(
      courseInfo: null == courseInfo
          ? _self.courseInfo
          : courseInfo // ignore: cast_nullable_to_non_nullable
              as CourseInfoModel,
      modulesWithLessons: null == modulesWithLessons
          ? _self._modulesWithLessons
          : modulesWithLessons // ignore: cast_nullable_to_non_nullable
              as List<CourseModulesWithLessons>,
    ));
  }
}

/// @nodoc

class FailedGetCourseContent<T> implements LearningCentreState<T> {
  const FailedGetCourseContent({required this.error});

  final String error;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailedGetCourseContentCopyWith<T, FailedGetCourseContent<T>> get copyWith =>
      _$FailedGetCourseContentCopyWithImpl<T, FailedGetCourseContent<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailedGetCourseContent<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LearningCentreState<$T>.failedGetCourseContent(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailedGetCourseContentCopyWith<T, $Res>
    implements $LearningCentreStateCopyWith<T, $Res> {
  factory $FailedGetCourseContentCopyWith(FailedGetCourseContent<T> value,
          $Res Function(FailedGetCourseContent<T>) _then) =
      _$FailedGetCourseContentCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailedGetCourseContentCopyWithImpl<T, $Res>
    implements $FailedGetCourseContentCopyWith<T, $Res> {
  _$FailedGetCourseContentCopyWithImpl(this._self, this._then);

  final FailedGetCourseContent<T> _self;
  final $Res Function(FailedGetCourseContent<T>) _then;

  /// Create a copy of LearningCentreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(FailedGetCourseContent<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LessonSelected<T> implements LearningCentreState<T> {
  const LessonSelected();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LessonSelected<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LearningCentreState<$T>.lessonSelected()';
  }
}

// dart format on
