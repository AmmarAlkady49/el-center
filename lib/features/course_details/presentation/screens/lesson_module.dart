import 'package:chewie/chewie.dart';
import 'package:e_learning_app/core/data/models/lesson_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class ModuleLessonsPage extends StatefulWidget {
  final String moduleTitle;
  final int moduleId;
  final List<LessonModule> lessons;

  const ModuleLessonsPage({
    super.key,
    required this.moduleTitle,
    required this.moduleId,
    required this.lessons,
  });

  @override
  State<ModuleLessonsPage> createState() => _ModuleLessonsPageState();
}

class _ModuleLessonsPageState extends State<ModuleLessonsPage> {
  int selectedLessonIndex = 0;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.lessons.isNotEmpty) {
      _initializeVideo(widget.lessons[0].content ?? 'content');
    }
  }

  void _initializeVideo(String videoUrl) async {
    setState(() {
      _isVideoLoading = true;
    });

    if (_chewieController != null) {
      _chewieController!.dispose();
    }
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }

    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    try {
      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: false,
        looping: false,
        aspectRatio: 16 / 9,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.mainBlue,
          handleColor: AppColors.mainBlue,
          backgroundColor: AppColors.grey,
          bufferedColor: AppColors.greyBlue.withOpacity(0.5),
        ),
        placeholder: Container(
          color: AppColors.darkGreyBlue,
          child: const Center(
            child: CupertinoActivityIndicator(color: AppColors.mainBlue),
          ),
        ),
      );

      setState(() {
        _isVideoLoading = false;
      });
    } catch (e) {
      setState(() {
        _isVideoLoading = false;
      });
    }
  }

  void _selectLesson(int index) {
    if (index != selectedLessonIndex && index < widget.lessons.length) {
      setState(() {
        selectedLessonIndex = index;
      });
      _initializeVideo(widget.lessons[index].content ?? 'content');
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                _buildVideoPlayer(),
                Expanded(
                  child: _buildLessonsList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.mainBlue,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.moduleTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.mainBlue,
                AppColors.secondaryBlue,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyBlue.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _isVideoLoading
            ? Container(
                color: AppColors.darkGreyBlue,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(color: AppColors.mainBlue),
                      SizedBox(height: 16),
                      Text(
                        'Loading video...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : _chewieController != null
                ? Chewie(controller: _chewieController!)
                : Container(
                    color: AppColors.darkGreyBlue,
                    child: const Center(
                      child: Text(
                        'Failed to load video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }

  Widget _buildLessonsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentLessonInfo(),
          verticalSpacing(24),
          _buildLessonsHeader(),
          verticalSpacing(16),
          Expanded(
            child: _buildLessonsListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLessonInfo() {
    final currentLesson = widget.lessons[selectedLessonIndex];
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyBlue.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Lesson ${currentLesson.orderIndex}',
                  style: const TextStyle(
                    color: AppColors.mainBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppColors.greyBlue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${currentLesson.durationInMinutes} min',
                      style: const TextStyle(
                        color: AppColors.greyBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          Text(
            currentLesson.title ?? 'No title available.',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGreyBlue,
            ),
          ),
          verticalSpacing(8),
          Text(
            currentLesson.description ?? 'No description available.',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.greyBlue,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsHeader() {
    return Row(
      children: [
        const Text(
          'Lessons',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.darkGreyBlue,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.mainBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${widget.lessons.length} lessons',
            style: const TextStyle(
              color: AppColors.mainBlue,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLessonsListView() {
    return ListView.builder(
      itemCount: widget.lessons.length,
      itemBuilder: (context, index) {
        final lesson = widget.lessons[index];
        final isSelected = index == selectedLessonIndex;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _selectLesson(index),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.mainBlue.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.mainBlue : Colors.transparent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyBlue.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.mainBlue
                            : AppColors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: isSelected
                            ? const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 24,
                              )
                            : Text(
                                '${lesson.orderIndex}',
                                style: const TextStyle(
                                  color: AppColors.greyBlue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson.title ?? 'lesson title',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.mainBlue
                                  : AppColors.darkGreyBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: AppColors.greyBlue,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${lesson.durationInMinutes} minutes',
                                style: const TextStyle(
                                  color: AppColors.greyBlue,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(
                                Icons.videocam,
                                size: 14,
                                color: AppColors.greyBlue,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                lesson.content != null ? 'video' : 'No video',
                                style: const TextStyle(
                                  color: AppColors.greyBlue,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.mainBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
