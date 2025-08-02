import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';

class ArticleReadingPage extends StatefulWidget {
  final LessonModule lesson;
  final LearningCentreCubit cubit;

  const ArticleReadingPage({
    super.key,
    required this.lesson,
    required this.cubit,
  });

  @override
  State<ArticleReadingPage> createState() => _ArticleReadingPageState();
}

class _ArticleReadingPageState extends State<ArticleReadingPage> {
  late ScrollController _scrollController;
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateScrollProgress);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollProgress() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      setState(() {
        _scrollProgress =
            maxScroll > 0 ? (currentScroll / maxScroll).clamp(0.0, 1.0) : 0.0;
      });
    }
  }

  bool _isHtmlContent(String content) {
    return content.contains('<') && content.contains('>');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.darkBlue,
            size: 20.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).article,
          style: FontHelper.font15BlackW600(context).copyWith(
            color: AppColors.darkBlue,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 4.0,
            color: AppColors.grey.withOpacity(0.2),
            child: LinearProgressIndicator(
              value: _scrollProgress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.mainBlue.withAlpha(30),
                    AppColors.mainBlue.withAlpha(15),
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.mainBlue.withAlpha(60),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Article icon and type
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.mainBlue.withAlpha(30),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.article_outlined,
                          size: 20.sp,
                          color: AppColors.mainBlue,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(S.of(context).article,
                          style: FontHelper.font15BlackW600(context).copyWith(
                            fontSize: 14.sp,
                            color: AppColors.mainBlue,
                          )),
                    ],
                  ),

                  verticalSpacing(16),

                  // Title
                  if (widget.lesson.title != null)
                    Text(widget.lesson.title!,
                        style: FontHelper.font20BlackW700(context).copyWith(
                          fontSize: 22.sp,
                          color: AppColors.darkBlue,
                          height: 1.3,
                        )),

                  verticalSpacing(12),

                  // Meta information
                  Row(
                    children: [
                      if (widget.lesson.durationInMinutes != null) ...[
                        Icon(
                          Icons.access_time,
                          size: 16.sp,
                          color: AppColors.greyBlue,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '${widget.lesson.durationInMinutes} ${S.of(context).min}',
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: AppColors.greyBlue,
                          ),
                        ),
                      ],
                      horizontalSpacing(16),
                      Icon(
                        Icons.visibility_outlined,
                        size: 16.sp,
                        color: AppColors.greyBlue,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        S.of(context).reading,
                        style: FontHelper.font14BlackW500(context).copyWith(
                          color: AppColors.greyBlue,
                        ),
                      ),
                    ],
                  ),

                  // Description if available
                  if (widget.lesson.description != null &&
                      widget.lesson.description!.isNotEmpty) ...[
                    SizedBox(height: 12.h),
                    Text(
                      widget.lesson.description!,
                      style: FontHelper.font14BlackW500(context).copyWith(
                        color: AppColors.greyBlue,
                        height: 1.4,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Article content
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: _isHtmlContent(widget.lesson.content!)
                  ? HtmlWidget(
                      widget.lesson.content!,
                      textStyle: FontHelper.font16BlackW600(context).copyWith(
                        fontSize: 20.sp,
                        color: AppColors.darkBlue,
                        height: 1.6,
                      ),
                      customStylesBuilder: (element) {
                        if (element.localName == 'div') {
                          return {
                            'text-align': 'right',
                            'direction': 'rtl',
                            'margin-bottom': '12px',
                          };
                        }
                        if (element.localName == 'b') {
                          return {
                            'font-weight': 'bold',
                            'color': AppColors.darkBlue.toString(),
                          };
                        }
                        if (element.localName == 'u') {
                          return {
                            'text-decoration': 'underline',
                          };
                        }
                        return null;
                      },
                    )
                  : Text(
                      widget.lesson.content!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.darkBlue,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.right,
                    ),
            ),

            SizedBox(height: 24.h),

            // Completion section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.mainBlue.withAlpha(25),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.mainBlue.withAlpha(55),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 48.sp,
                    color: AppColors.mainBlue,
                  ),
                  SizedBox(height: 12.h),
                  Text('${S.of(context).article_completed}!',
                      style: FontHelper.font20BlackW700(context).copyWith(
                        fontSize: 17.sp,
                        color: AppColors.darkBlue,
                      )),
                  verticalSpacing(8),
                  Text(
                    S.of(context).greadt_job_reading,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      fontSize: 13.sp,
                      color: AppColors.greyBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpacing(16),
                  ElevatedButton(
                    onPressed: () {
                      widget.cubit.completeLesson(widget.lesson.id);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainBlue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Text(
                      S.of(context).continue_learning,
                      style: FontHelper.font16WhiteW600(context),
                    ),
                  ),
                ],
              ),
            ),

            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
