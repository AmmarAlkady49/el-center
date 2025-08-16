import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/quiz_model.dart';

class LessonQuizPage extends StatefulWidget {
  final List<QuizModel> quizzes;
  const LessonQuizPage({super.key, required this.quizzes});

  @override
  State<LessonQuizPage> createState() => _LessonQuizPageState();
}

class _LessonQuizPageState extends State<LessonQuizPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _progressAnimationController;
  late Animation<double> _progressAnimation;

  int currentQuestionIndex = 0;
  Map<int, String> selectedAnswers = {};
  bool isQuizCompleted = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressAnimationController,
      curve: Curves.easeInOut,
    ));
    _updateProgress();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    final progress = (currentQuestionIndex + 1) / widget.quizzes.length;
    _progressAnimationController.animateTo(progress);
  }

  void _selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < widget.quizzes.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _updateProgress();
    } else {
      _submitQuiz();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _updateProgress();
    }
  }

  void _submitQuiz() {
    setState(() {
      isQuizCompleted = true;
    });
    _showResultsDialog();
  }

  int _calculateScore() {
    int correctAnswers = 0;
    for (int i = 0; i < widget.quizzes.length; i++) {
      final quiz = widget.quizzes[i];
      final selectedAnswer = selectedAnswers[i];
      if (selectedAnswer == quiz.correctAnswer) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  double _calculatePercentage() {
    final score = _calculateScore();
    return (score / widget.quizzes.length) * 100;
  }

  void _showResultsDialog() {
    final score = _calculateScore();
    final percentage = _calculatePercentage();
    final totalQuestions = widget.quizzes.length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => QuizResultsDialog(
        score: score,
        totalQuestions: totalQuestions,
        percentage: percentage,
        quizzes: widget.quizzes,
        selectedAnswers: selectedAnswers,
        onRetake: () {
          Navigator.of(context).pop();
          _resetQuiz();
        },
        onClose: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswers.clear();
      isQuizCompleted = false;
    });
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGenericAppBar(
        context,
        title: 'Quiz',
        backgroundColor: AppColors.backgroundWiteColor,
        elevation: 0,
        textStyle: FontHelper.font16BlackW600(context).copyWith(
          color: AppColors.darkBlue,
          fontSize: 20.sp,
        ),
        iconColor: AppColors.darkBlue,
      ),
      body: Column(
        children: [
          _buildProgressHeader(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentQuestionIndex = index;
                });
                _updateProgress();
              },
              itemCount: widget.quizzes.length,
              itemBuilder: (context, index) {
                return _buildQuestionCard(widget.quizzes[index], index);
              },
            ),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${S.of(context).question} ${currentQuestionIndex + 1}',
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              Text(
                '${currentQuestionIndex + 1}/${widget.quizzes.length}',
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: AppColors.darkGreyBlue,
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _progressAnimation.value,
                backgroundColor: AppColors.grey.withAlpha(100),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
                minHeight: 6.h,
                borderRadius: BorderRadius.circular(12.r),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(QuizModel quiz, int index) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainBlue,
                  AppColors.mainBlue.withAlpha(200),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(100),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              quiz.question,
              style: FontHelper.font15BlackW600(context).copyWith(
                color: Colors.white,
                fontSize: 18.sp,
                height: 1.4,
              ),
            ),
          ),
          verticalSpacing(24),
          _buildOptionButton('A', quiz.optionA, index),
          verticalSpacing(12),
          _buildOptionButton('B', quiz.optionB, index),
          verticalSpacing(12),
          _buildOptionButton('C', quiz.optionC, index),
          verticalSpacing(12),
          _buildOptionButton('D', quiz.optionD, index),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String option, String text, int questionIndex) {
    final isSelected = selectedAnswers[questionIndex] == option;

    return GestureDetector(
      onTap: () => _selectAnswer(option),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainBlue : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color:
                isSelected ? AppColors.mainBlue : AppColors.grey.withAlpha(100),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.mainBlue.withAlpha(50)
                  : Colors.black.withAlpha(25),
              blurRadius: isSelected ? 8 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.white : AppColors.grey.withAlpha(120),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  option,
                  style: FontHelper.font16BlackW600(context).copyWith(
                    color: isSelected ? AppColors.mainBlue : AppColors.darkBlue,
                  ),
                ),
              ),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Text(
                text,
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: isSelected ? Colors.white : AppColors.darkBlue,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    final hasSelectedAnswer = selectedAnswers.containsKey(currentQuestionIndex);
    final isLastQuestion = currentQuestionIndex == widget.quizzes.length - 1;

    return Container(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          if (currentQuestionIndex > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousQuestion,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  side: BorderSide(color: AppColors.mainBlue, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  S.of(context).previous,
                  style: FontHelper.font16BlackW600(context).copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ),
            ),
          if (currentQuestionIndex > 0) horizontalSpacing(12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: hasSelectedAnswer ? _nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: hasSelectedAnswer
                    ? AppColors.mainBlue
                    : AppColors.grey.withAlpha(100),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: hasSelectedAnswer ? 4 : 0,
              ),
              child: Text(
                isLastQuestion
                    ? S.of(context).submit_quiz
                    : S.of(context).next_question,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: hasSelectedAnswer ? Colors.white : AppColors.darkBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizResultsDialog extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final double percentage;
  final List<QuizModel> quizzes;
  final Map<int, String> selectedAnswers;
  final VoidCallback onRetake;
  final VoidCallback onClose;

  const QuizResultsDialog({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.percentage,
    required this.quizzes,
    required this.selectedAnswers,
    required this.onRetake,
    required this.onClose,
  });

  Color _getScoreColor() {
    if (percentage >= 80) return AppColors.mainBlue;
    if (percentage >= 60) return AppColors.secondaryBlue;
    return AppColors.greyBlue;
  }

  Color _getScoreAccentColor() {
    if (percentage >= 80) return AppColors.mainBlue;
    if (percentage >= 60) return AppColors.secondaryBlue;
    return AppColors.red;
  }

  String _getScoreMessage(BuildContext context) {
    if (percentage >= 80) return '${S.of(context).Excellent}!';
    if (percentage >= 60) return '${S.of(context).Good_Job}!';
    return '${S.of(context).Keep_Practicing}!';
  }

  IconData _getScoreIcon() {
    if (percentage >= 80) return Icons.emoji_events_rounded;
    if (percentage >= 60) return Icons.thumb_up_rounded;
    return Icons.school_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              _getScoreColor().withAlpha(25),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: _getScoreColor().withAlpha(50),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(
                _getScoreIcon(),
                size: 48.sp,
                color: _getScoreColor(),
              ),
            ),
            verticalSpacing(16),
            Text(
              _getScoreMessage(context),
              style: FontHelper.font24BlackW700(context).copyWith(
                color: _getScoreColor(),
              ),
            ),
            verticalSpacing(8),
            Text(
              '${S.of(context).You_scored} $score ${S.of(context).out_of} $totalQuestions',
              style: FontHelper.font16BlackW500(context).copyWith(
                color: AppColors.darkBlue,
              ),
            ),
            verticalSpacing(16),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.grey.withAlpha(25),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    S.of(context).Score,
                    '${percentage.toInt()}%',
                    _getScoreAccentColor(),
                    context,
                  ),
                  _buildStatItem(
                    S.of(context).Correct,
                    '$score',
                    _getScoreAccentColor(),
                    context,
                  ),
                  _buildStatItem(
                    S.of(context).Wrong,
                    '${totalQuestions - score}',
                    _getScoreAccentColor(),
                    context,
                  ),
                ],
              ),
            ),
            verticalSpacing(20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onRetake,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: BorderSide(color: AppColors.mainBlue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      S.of(context).retake_quiz,
                      style: FontHelper.font15BlackW600(context)
                          .copyWith(color: AppColors.mainBlue, fontSize: 14.sp),
                    ),
                  ),
                ),
                horizontalSpacing(12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onClose,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainBlue,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      S.of(context).continue_learning,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: FontHelper.font15BlackW600(context)
                          .copyWith(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, Color color, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: color,
            fontSize: 18.sp,
          ),
        ),
        verticalSpacing(4),
        Text(
          label,
          style: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.greyBlue,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
