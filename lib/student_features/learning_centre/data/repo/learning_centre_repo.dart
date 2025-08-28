import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';
import 'package:e_learning_app/env.dart';

import '../../../../core/data/models/completed_lesson_model.dart';
import '../../../../core/data/models/standard_response_body.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../model/answer_model_for_q_and_a.dart';
import '../model/question_model_for_q_and_a.dart';
import '../model/quiz_model.dart';

class LearningCentreRepo {
  final ApiService apiService;

  LearningCentreRepo(this.apiService);
  final dio = Dio();

  Future<ApiResult<List<QuizModel>>> getAllCourseQuizzes(int courseId) async {
    try {
      final response = await apiService.getAllCourseQuizzes(courseId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<StandardResponseBody>> completeLesson(int lessonId) async {
    try {
      final response = await apiService.completeLesson(lessonId);
      return ApiResult.success(response);
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<List<CompletedLessonModel>> getCompletedLessons(int courseId) async {
    try {
      final response = await apiService.getCompletedLessons(courseId);
      return response ?? [];
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // post request for getting the response from the particular ai model

  Future<dynamic> sendMessageToGroq(
      String userMessage, String lessonScript) async {
    final response = await dio.post(
      'https://api.groq.com/openai/v1/chat/completions',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Env.groqApiKey3}',
        },
      ),
      data: {
        "model": "llama3-8b-8192",
        "messages": [
          {
            "role": "system",
            "content":
                "You are an educational assistant. Only answer questions strictly based on the following lesson content. If the question is not related to the lesson, respond with: 'This question is outside the scope of this lesson.'\n\nLesson content:\n$lessonScript"
          },
          {"role": "user", "content": userMessage}
        ],
        "temperature": 0.5,
        "max_tokens": 1024,
        "top_p": 1,
        "stream": false
      },
    );
    return response;
  }

// post request for getting the response from the AssemblyAi model
  Future<String> requestTranscription(String videoUrl) async {
    final response = await dio.post(
      'https://api.assemblyai.com/v2/transcript',
      data: {
        'audio_url': videoUrl,
        'language_code': 'en',
      },
      options: Options(
        headers: {
          'Authorization': Env.assemblyAiApiKey3,
          'Content-Type': 'application/json',
        },
      ),
    );

    final String transcriptId = response.data['id'];
    return transcriptId;
  }

  /// Poll until transcription is complete
  Future<String> getTranscriptionResult(String transcriptId) async {
    while (true) {
      final response = await dio.get(
        'https://api.assemblyai.com/v2/transcript/$transcriptId',
        options: Options(
          headers: {'Authorization': Env.assemblyAiApiKey3},
        ),
      );

      final status = response.data['status'];
      if (status == 'completed') {
        return response.data['text'];
      } else if (status == 'error') {
        throw Exception('Transcription failed: ${response.data['error']}');
      }

      // Wait before polling again
      await Future.delayed(Duration(seconds: 3));
    }
  }

  /// Combined helper function: submit + wait + return result
  Future<String> transcribeVideoFromUrl(String videoUrl) async {
    final id = await requestTranscription(videoUrl);
    final result = await getTranscriptionResult(id);
    return result;
  }

  Future<List<QuestionModelForQAndA>> getAllLessonQuestions(
      int lessonId) async {
    try {
      final response = await apiService.getAllLessonQuestions(lessonId);
      return response;
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<List<AnswerModelForQAndA>> getAllQuestionAnswers(
      int questionId) async {
    try {
      final response = await apiService.getAllQuestionAnswers(questionId);
      return response;
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<StandardResponseBody> sendReport(Map<String, dynamic> query) async {
    try {
      final response = await apiService.sendReport(query);
      return response;
    } catch (error) {
      throw "failed to send report ${error.toString()}";
    }
  }

  Future<StandardResponseBody> deleteAnswer(int answerId) async {
    try {
      final response = await apiService.deleteAnswer(answerId);
      return response;
    } catch (error) {
      throw "failed to delete answer Or Question ${error.toString()}";
    }
  }

  Future<StandardResponseBody> deleteQuestion(int questionId) async {
    try {
      final response = await apiService.deleteQuestion(questionId);
      return response;
    } catch (error) {
      throw "failed to delete answer Or Question ${error.toString()}";
    }
  }

  // mark answer helpful
  Future<StandardResponseBody> markAnswerHelpful(
      Map<String, dynamic> query) async {
    try {
      final response = await apiService.markAnswerHelpful(query);
      return response;
    } catch (error) {
      throw "failed to mark answer helpful";
    }
  }

  Future<StandardResponseBody> addAnswer(int questionId, String answer) async {
    try {
      final response = await apiService.addAnswer(questionId, answer);
      return response;
    } catch (error) {
      throw "failed to add answer";
    }
  }

  Future<StandardResponseBody> updateAnswer(int answerId, String answer) async {
    try {
      final response = await apiService.updateAnswer(answerId, answer);
      return response;
    } catch (error) {
      throw "failed to update answer";
    }
  }

  Future<StandardResponseBody> updateQuestion(
      int questionId, String question) async {
    try {
      final response = await apiService.updateQuestion(questionId, question);
      return response;
    } catch (error) {
      throw "failed to update question";
    }
  }

  Future<StandardResponseBody> addQuestion(
      int lessonId, String question) async {
    try {
      final response = await apiService.addQuestion(lessonId, question);
      return response;
    } catch (error) {
      throw "failed to add question ${error.toString()}";
    }
  }
}
