import 'package:chewie/chewie.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/course_details_state.dart';

class BuildVideoPreviewPlayer extends StatelessWidget {
  final CourseDetailsCubit cubit;
  const BuildVideoPreviewPlayer({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
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
}