import 'package:chewie/chewie.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_state.dart';

class BuildVideoPlayer extends StatefulWidget {
  const BuildVideoPlayer({super.key});

  @override
  State<BuildVideoPlayer> createState() => _BuildVideoPlayerState();
}

class _BuildVideoPlayerState extends State<BuildVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LearningCentreCubit>();
    return Container(
      height: 217.h,
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.black, width: 1.w))),
      child: BlocBuilder<LearningCentreCubit, LearningCentreState>(
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
                child: Text(
                  state.error,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
