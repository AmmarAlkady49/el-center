import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/student_features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_state.dart';

class BuildContentPlayer extends StatefulWidget {
  final List<LessonModule> lessons;
  final LearningCentreCubit cubit;

  const BuildContentPlayer(
      {super.key, required this.lessons, required this.cubit});

  @override
  State<BuildContentPlayer> createState() => _BuildContentPlayerState();
}

class _BuildContentPlayerState extends State<BuildContentPlayer> {
  LessonModule? lastLesson;

  @override
  void initState() {
    super.initState();
    _initializeCurrentLesson();
  }

  void _initializeCurrentLesson() {
    if (widget.lessons.isNotEmpty && widget.cubit.currentLesson != null) {
      final currentLesson = widget.cubit.currentLesson!;
      lastLesson = currentLesson;

      // Only initialize video if the content type is video
      if (currentLesson.contentType == 'video' &&
          currentLesson.content != null) {
        widget.cubit.initializeVideo(currentLesson.content!);
        widget.cubit.transcribeVideo(currentLesson.content!, currentLesson);
      } else if (currentLesson.contentType == 'text' &&
          currentLesson.content != null) {
        widget.cubit.initializeText(currentLesson);
        widget.cubit.transcribeVideo(currentLesson.content!, currentLesson);
      }
    }
  }

  @override
  void didUpdateWidget(BuildContentPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the current lesson has changed
    final currentLesson = widget.cubit.currentLesson;
    if (currentLesson != null && currentLesson != lastLesson) {
      lastLesson = currentLesson;

      // Initialize video for new lesson if it's a video
      if (currentLesson.contentType == 'video' &&
          currentLesson.content != null) {
        widget.cubit.initializeVideo(currentLesson.content!);
        widget.cubit.transcribeVideo(currentLesson.content!, currentLesson);
        log("called initailzed video");
      } else if (currentLesson.contentType == 'text' &&
          currentLesson.content != null) {
        widget.cubit.initializeText(currentLesson);
        widget.cubit.transcribeVideo(currentLesson.content!, currentLesson);
        log("called initailzed text");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current lesson
    final currentLesson = widget.cubit.currentLesson;

    if (currentLesson == null) {
      return Container(
        height: 217.h,
        decoration: BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: Colors.black, width: 1.w))),
        child: Center(
          child: Text('No lesson selected'),
        ),
      );
    }

    return Container(
      height: 217.h,
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.black, width: 1.w))),
      child: _buildContentBasedOnType(widget.cubit, currentLesson),
    );
  }

  // Rest of your methods remain the same...
  Widget _buildContentBasedOnType(
      LearningCentreCubit cubit, LessonModule lesson) {
    if (lesson.contentType == 'video') {
      return _buildVideoPlayer(cubit);
    } else if (lesson.contentType == 'text') {
      return _buildTextContent(lesson, cubit);
    } else {
      return _buildUnsupportedContent();
    }
  }

  Widget _buildVideoPlayer(LearningCentreCubit cubit) {
    return BlocBuilder<LearningCentreCubit, LearningCentreState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is LoadingVideo ||
          current is VideoLoaded ||
          current is VideoLoadFailed,
      builder: (context, state) {
        if (state is LoadingVideo) {
          return Container(
            color: AppColors.darkGreyBlue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(color: AppColors.mainBlue),
                  SizedBox(height: 16),
                  Text(
                    S.of(context).loading_video,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is VideoLoaded) {
          return cubit.chewieController != null
              ? Chewie(controller: cubit.chewieController!)
              : Container(
                  color: AppColors.darkGreyBlue,
                  child: Center(
                    child: Text(
                      S.of(context).failed_to_load_video,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
        } else if (state is VideoLoadFailed) {
          return Container(
            color: AppColors.darkGreyBlue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text(
                    S.of(context).failed_to_load_video,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildTextContent(LessonModule lesson, LearningCentreCubit cubit) {
    return BlocBuilder<LearningCentreCubit, LearningCentreState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is SuccessTextContent,
      builder: (context, state) {
        if (state is SuccessTextContent) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.articleReading,
                arguments: {'lesson': lesson, 'cubit': cubit}),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFAFBFC),
                    Color(0xFFF1F5F9),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background pattern
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainBlue.withAlpha(25),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -30,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainBlue.withAlpha(25),
                      ),
                    ),
                  ),

                  // Main content
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Article icon
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: AppColors.mainBlue.withAlpha(35),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Icon(
                            Icons.article_outlined,
                            size: 30.sp,
                            color: AppColors.mainBlue,
                          ),
                        ),

                        verticalSpacing(8),

                        // Title
                        if (lesson.title != null)
                          Text(
                            lesson.title!,
                            style: FontHelper.font16BlackW600(context).copyWith(
                              color: AppColors.darkBlue,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        verticalSpacing(4),

                        // Description
                        Text(
                          S.of(context).this_lesson_is_an_article,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: AppColors.greyBlue,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        verticalSpacing(12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Duration badge - Modern pill style
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.mainBlue.withAlpha(20),
                                    AppColors.mainBlue.withAlpha(30),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: AppColors.mainBlue.withAlpha(60),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.schedule_outlined,
                                    size: 14.sp,
                                    color: AppColors.mainBlue,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    '${lesson.durationInMinutes ?? 0} ${S.of(context).min}',
                                    style: FontHelper.font15BlackW600(context)
                                        .copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.mainBlue,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            horizontalSpacing(12),

                            // Click to read button - Modern elevated style
                            Expanded(
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.mainBlue,
                                      AppColors.mainBlue.withAlpha(210),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(22.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.mainBlue.withAlpha(90),
                                      offset: Offset(0, 6),
                                      blurRadius: 12,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: AppColors.mainBlue.withAlpha(30),
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(22.r),
                                    // onTap: () => ,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.menu_book_outlined,
                                            size: 16.sp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(S.of(context).read_article,
                                              style: FontHelper.font15BlackW600(
                                                      context)
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                letterSpacing: 0.3,
                                              )),
                                          horizontalSpacing(6),
                                          Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withAlpha(60),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward,
                                              size: 12.sp,
                                              color: Colors.white,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // return _buildUnsupportedContent();
          return _buildLoadingContent();
        }
      },
    );
  }

  Widget _buildLoadingContent() {
    return Container(
      color: AppColors.backgroundWiteColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(color: AppColors.mainBlue),
            verticalSpacing(16),
            Text(S.of(context).loading_content,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: AppColors.greyBlue,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildUnsupportedContent() {
    return Container(
      color: AppColors.backgroundWiteColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_outlined,
              size: 48.sp,
              color: AppColors.greyBlue,
            ),
            verticalSpacing(16),
            Text(S.of(context).unsupported_content_type,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: AppColors.greyBlue,
                )),
          ],
        ),
      ),
    );
  }
}
