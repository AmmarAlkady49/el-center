import 'package:chewie/chewie.dart';
import 'package:e_learning_app/core/data/models/course_info_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../data/model/answer_model_for_q_and_a.dart';
import '../../data/model/question_model_for_q_and_a.dart';
import '../../data/model/quiz_model.dart';

part 'learning_centre_state.freezed.dart';

@freezed
class LearningCentreState<T> with _$LearningCentreState<T> {
  const factory LearningCentreState.initial() = _Initial;

  const factory LearningCentreState.selectedContentOfTheCourse({
    required CourseInfoModel courseInfo,
    required LessonModule lesson,
    required List<CourseModulesWithLessons> modulesWithLessons,
  }) = SelectedContentOfTheCourse;

  const factory LearningCentreState.gettingQuizzesByCourse() =
      GettingQuizzesByCourse;

  const factory LearningCentreState.successGettingQuizzesByCourse(
      {required List<QuizModel> quizzes}) = SuccessGettingQuizzesByCourse;

  const factory LearningCentreState.faieldGettingQuizzedByCourse(
      {required String error}) = FaieldGettingQuizzedByCourse;

  const factory LearningCentreState.loadingVideo() = LoadingVideo;
  const factory LearningCentreState.moduleExpandedStateChanged() =
      ModuleExpandedStateChanged;

  const factory LearningCentreState.videoLoaded({
    required VideoPlayerController videoPlayerController,
    required ChewieController chewieController,
  }) = VideoLoaded;
  const factory LearningCentreState.videoLoadFailed({required String error}) =
      VideoLoadFailed;

  const factory LearningCentreState.successCompleteLesson(
      {required int lessonId}) = SuccessCompleteLesson;

  const factory LearningCentreState.failedCompleteLesson(
      {required String error}) = FailedCompleteLesson;

  const factory LearningCentreState.loadingCompletedLessons() =
      LoadingCompletedLessons;

  const factory LearningCentreState.successGetCompletedLessons({
    required Set<int> completedLessonIds,
  }) = SuccessGetCompletedLessons;

  const factory LearningCentreState.loadingTextContent() = LoadingTextContent;

  const factory LearningCentreState.successTextContent() = SuccessTextContent;

  const factory LearningCentreState.failedTextContent() = FailedTextContent;

  const factory LearningCentreState.failedGetCompletedLessons(
      {required String error}) = FailedGetCompletedLessons;

  const factory LearningCentreState.loadingCourseContent() =
      LoadingCourseContent;

  const factory LearningCentreState.successGetCourseContent({
    required CourseInfoModel courseInfo,
    required List<CourseModulesWithLessons> modulesWithLessons,
  }) = SuccessGetCourseContent;

  const factory LearningCentreState.failedGetCourseContent(
      {required String error}) = FailedGetCourseContent;
  const factory LearningCentreState.lessonSelected() = LessonSelected;

  const factory LearningCentreState.loadingSendMessageToGroqAi() =
      LoadingSendMessageToGroqAi;

  const factory LearningCentreState.successSendMessageToGroqAi(
      {required String response}) = SuccessSendMessageToGroqAi;

  const factory LearningCentreState.failedSendMessageToGroqAi(
      {required String error}) = FailedSendMessageToGroqAi;

  const factory LearningCentreState.chatCleared() = ChatCleared;

  const factory LearningCentreState.loadingTranscribeVideo() =
      LoadingTranscribeVideo;

  const factory LearningCentreState.successTranscribeVideo({
    required String transcriptString,
  }) = SuccessTranscribeVideo;

  const factory LearningCentreState.failedTranscribeVideo(
      {required String error}) = FailedTranscribeVideo;

  const factory LearningCentreState.contentReady() = ContentReady;

  const factory LearningCentreState.contentNotReady() = ContentNotReady;

  const factory LearningCentreState.gettingQAndAtap() = GettingQAndAtap;

  const factory LearningCentreState.successGettingQAndAData({
    required List<QuestionModelForQAndA> questions,
    required List<AnswerModelForQAndA> answers,
  }) = SuccessGettingQAndAData;

  const factory LearningCentreState.failedGettingQAndA({
    required String error,
  }) = FailedGettingQAndA;

  const factory LearningCentreState.successSendReport() = SuccessSendReport;

  const factory LearningCentreState.failedSendReport({
    required String error,
  }) = FailedSendReport;

  const factory LearningCentreState.successDeleteAnswerOrQuestion() =
      SuccessDeleteAnswerOrQuestion;

  const factory LearningCentreState.failedDeleteAnswerOrQuestion({
    required String error,
  }) = FailedDeleteAnswerOrQuestion;

  const factory LearningCentreState.successMarkAnswerHelpful(
      {required int? answerId,
      required int? questionId}) = SuccessMarkAnswerHelpful;

  const factory LearningCentreState.failedMarkAnswerHelpful({
    required String error,
  }) = FailedMarkAnswerHelpful;

  const factory LearningCentreState.loadingAddAnswer() = LoadingAddAnswer;

  const factory LearningCentreState.successAddAnswer() = SuccessAddAnswer;

  const factory LearningCentreState.failedAddAnswer({
    required String error,
  }) = FailedAddAnswer;
}
