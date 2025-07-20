import 'package:e_learning_app/core/data/models/course_module_model.dart';
import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildCurriculumTab extends StatefulWidget {
  final List<CourseModuleModel> courseModules;
  final List<Map<String, dynamic>> modulesWithLessons;

  const BuildCurriculumTab({
    super.key,
    required this.courseModules,
    required this.modulesWithLessons,
  });

  @override
  State<BuildCurriculumTab> createState() => _BuildCurriculumTabState();
}

class _BuildCurriculumTabState extends State<BuildCurriculumTab> {
  // Track which modules are expanded
  int? expandedModuleIndex;

  // Helper method to get content type icon
  IconData _getContentTypeIcon(String? contentType) {
    switch (contentType?.toLowerCase()) {
      case 'video':
        return Icons.play_arrow_outlined;
      case 'audio':
        return Icons.headphones;
      case 'text':
        return Icons.article_outlined;
      default:
        return Icons.play_circle_outline;
    }
  }

  List<Widget> _buildLessonsForModule(int moduleId, int moduleIndex) {
    final module = widget.modulesWithLessons.firstWhere(
      (item) => item['module'].id == moduleId,
      orElse: () => {},
    );

    final lessons = module['lessons'] ?? [];

    if (lessons.isEmpty) {
      return [
        Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 20,
              color: AppColors.greyBlue,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                S.of(context).no_lessons_available_for_this_module,
                style: FontHelper.font12lackW400(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ];
    }

    return [
      SizedBox(
        height: lessons.length * 50.0,
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              final duration =
                  HelperFunctions.formatDuration(lesson.durationInMinutes);

              return Row(
                children: [
                  Icon(
                    _getContentTypeIcon(lesson.contentType),
                    size: 22.sp,
                    color: AppColors.greyBlue.withAlpha(150),
                  ),
                  horizontalSpacing(6),
                  Text(
                    '${moduleIndex + 1}.${index + 1}',
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                  horizontalSpacing(8),
                  Text(
                    lesson.title,
                    style: FontHelper.font12lackW400(context).copyWith(
                      color: AppColors.darkBlue.withAlpha(200),
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  if (duration.isNotEmpty) ...[
                    if (lesson.contentType != null) const SizedBox(width: 8),
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppColors.darkBlue.withAlpha(150),
                    ),
                    horizontalSpacing(4),
                    Text(
                      duration,
                      style: FontHelper.font12lackW400(context).copyWith(
                        color: AppColors.darkBlue.withAlpha(150),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ],
              );
            },
            separatorBuilder: (context, index) =>
                Divider(color: AppColors.grey.withAlpha(200))),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _buildCurriculumTab(
        context, widget.courseModules, widget.modulesWithLessons);
  }

  Widget _buildCurriculumTab(BuildContext context, List courseModules,
      List<Map<String, dynamic>> modulesWithLessons) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${S.of(context).course} ${S.of(context).curriculum}",
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
            ),
          ),
          verticalSpacing(4),
          Text(
            courseModules.isEmpty
                ? 'No Curriculum available.'
                // : '${courseModules.length} ${S.of(context).modules} • ${modulesWithLessons[0]['lessons'].length} ${S.of(context).lessons}',
                : '${courseModules.length} ${S.of(context).modules}',
            style: FontHelper.font12lackW400(context).copyWith(
              fontSize: 14.sp,
              letterSpacing: -0.2,
              color: AppColors.greyBlue,
            ),
          ),
          verticalSpacing(16),
          if (courseModules.isNotEmpty)
            ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  if (expandedModuleIndex == index) {
                    expandedModuleIndex = null;
                  } else {
                    expandedModuleIndex = (index);
                  }
                });
              },
              children:
                  courseModules.asMap().entries.map<ExpansionPanel>((entry) {
                final index = entry.key;
                final module = entry.value;

                return ExpansionPanel(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  isExpanded: expandedModuleIndex == index,
                  headerBuilder: (context, isExpanded) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.comfortable,
                        dense: true,
                        minLeadingWidth: 0,
                        minVerticalPadding: 0,
                        style: ListTileStyle.list,
                        title: Text.rich(
                          TextSpan(
                            text: "${index + 1}. ",
                            style: FontHelper.font15BlackW600(context).copyWith(
                              letterSpacing: -0.2,
                              color: AppColors.darkBlue,
                            ),
                            children: [
                              TextSpan(
                                text: module.title,
                                style: FontHelper.font14BlackW500(context)
                                    .copyWith(
                                  letterSpacing: -0.2,
                                  color: AppColors.darkBlue,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._buildLessonsForModule(module.id, index),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
        ],
      ),
    );
  }
}
