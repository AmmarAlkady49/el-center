import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_state.dart';

class AiChatBotPage extends StatelessWidget {
  final LearningCentreCubit cubit;
  const AiChatBotPage({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LearningCentreCubit, LearningCentreState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is LoadingSendMessageToGroqAi ||
          current is SuccessSendMessageToGroqAi ||
          current is FailedSendMessageToGroqAi ||
          current is ChatCleared ||
          current is ContentNotReady ||
          current is ContentReady,
      listenWhen: (previous, current) =>
          current is LoadingSendMessageToGroqAi ||
          current is SuccessSendMessageToGroqAi ||
          current is FailedSendMessageToGroqAi ||
          current is ChatCleared ||
          current is ContentNotReady ||
          current is ContentReady,
      listener: (context, state) {
        if (state is SuccessSendMessageToGroqAi) {
          cubit.messages.add(ChatMessage(
            text: state.response,
            isUser: false,
          ));
          _scrollToBottom(cubit);
        } else if (state is FailedSendMessageToGroqAi) {
          cubit.messages.add(ChatMessage(
            text:
                "Sorry, I'm having trouble responding right now. Please try again.",
            isUser: false,
          ));
          _scrollToBottom(cubit);
        } else if (state is ChatCleared) {
          HelperDialogs.showSuccess(S.of(context).chat_cleared, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: _buildAppBar(context, cubit, state),
          body: Column(
            children: [
              Expanded(
                child: cubit.messages.isEmpty
                    ? _buildEmptyState(context, cubit)
                    : _buildChatList(cubit, state),
              ),
              _buildInputArea(context, cubit, state),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context,
      LearningCentreCubit cubit, LearningCentreState state) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.chevron_left_rounded,
          color: AppColors.darkBlue,
          size: 30.sp,
        ),
      ),
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.mainBlue.withAlpha(50),
                  AppColors.mainBlue.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Iconsax.cpu_charge,
              size: 20.sp,
              color: AppColors.mainBlue,
            ),
          ),
          horizontalSpacing(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).ai_assistant,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              Text(
                // cubit.isTyping ? S.of(context).typing : S.of(context).online,
                state is LoadingSendMessageToGroqAi
                    ? S.of(context).typing
                    : S.of(context).online,
                style: FontHelper.font12lackW400(context).copyWith(
                  // color: cubit.isTyping ? AppColors.mainBlue : Colors.green,
                  color: state is LoadingSendMessageToGroqAi
                      ? AppColors.mainBlue
                      : Colors.green,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => _clearChat(cubit),
          icon: Icon(
            Iconsax.trash,
            color: AppColors.greyBlue,
            size: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, LearningCentreCubit cubit) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.mainBlue.withAlpha(50),
                    AppColors.mainBlue.withAlpha(25),
                  ],
                ),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(
                Iconsax.message_text,
                size: 48.sp,
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpacing(24),
            Text(
              S.of(context).start_conversation_ai,
              style: FontHelper.font15BlackW600(context)
                  .copyWith(color: AppColors.darkBlue, fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(8),
            Text.rich(TextSpan(
                text: "${S.of(context).please_note}: ",
                style: FontHelper.font12lackW400(context)
                    .copyWith(color: AppColors.darkBlue, fontSize: 14.sp),
                children: [
                  TextSpan(
                    text: S.of(context).ai_help_description,
                    style: FontHelper.font12lackW400(context)
                        .copyWith(color: AppColors.greyBlue, fontSize: 14.sp),
                  )
                ])),
            verticalSpacing(32),
            _buildSuggestedQuestions(cubit, context),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedQuestions(
      LearningCentreCubit cubit, BuildContext context) {
    final suggestions = [
      S.of(context).explain_this_lesson,
      S.of(context).practice_questions,
      S.of(context).summarize_content,
    ];

    // Check if content is ready
    var isContentReady = cubit.isContentReady &&
        cubit.scriptContent != null &&
        cubit.scriptContent!.isNotEmpty;

    return Column(
      children: [
        // Add a status indicator
        if (!isContentReady) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16.w,
                  height: 16.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
                horizontalSpacing(12),
                Expanded(
                  child: Text(
                    S.of(context).loading_lesson_content_for_ai_assistant,
                    style: FontHelper.font12lackW400(context).copyWith(
                      color: Colors.orange.shade700,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        // Suggested questions (disabled when content not ready)
        ...suggestions.map((suggestion) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: isContentReady ? Colors.white : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: isContentReady
                  ? [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2.h),
                        blurRadius: 10.r,
                      ),
                    ]
                  : null,
            ),
            child: Material(
              color: isContentReady ? Colors.white : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: isContentReady
                    ? () => _sendMessage(
                        text: suggestion, cubit: cubit, state: cubit.state)
                    : null,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.message_question,
                        size: 16.sp,
                        color: isContentReady
                            ? AppColors.mainBlue
                            : Colors.grey.shade400,
                      ),
                      horizontalSpacing(12),
                      Expanded(
                        child: Text(
                          suggestion,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: isContentReady
                                ? AppColors.darkBlue
                                : Colors.grey.shade500,
                          ),
                        ),
                      ),
                      if (!isContentReady)
                        Icon(
                          Icons.lock_outline,
                          size: 14.sp,
                          color: Colors.grey.shade400,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildChatList(LearningCentreCubit cubit, LearningCentreState state) {
    return ListView.builder(
      controller: cubit.scrollController,
      padding: EdgeInsets.all(16.w),
      itemCount:
          cubit.messages.length + (state is LoadingSendMessageToGroqAi ? 1 : 0),
      itemBuilder: (context, index) {
        // Show typing indicator when loading
        if (index == cubit.messages.length &&
            state is LoadingSendMessageToGroqAi) {
          return _buildTypingIndicator();
        }
        return _buildMessageBubble(cubit.messages[index], context);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message, BuildContext context) {
    final isUser = message.isUser;
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainBlue.withAlpha(50),
                    AppColors.mainBlue.withAlpha(25),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Iconsax.cpu_charge,
                size: 16.sp,
                color: AppColors.mainBlue,
              ),
            ),
            horizontalSpacing(8),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isUser ? AppColors.mainBlue : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isUser ? 16.r : 4.r),
                  topRight: Radius.circular(isUser ? 4.r : 16.r),
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2.h),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: FontHelper.font12lackW400(context).copyWith(
                  color: isUser ? Colors.white : AppColors.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            horizontalSpacing(8),
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.mainBlue.withAlpha(30),
              child: Icon(
                Iconsax.user,
                size: 16.sp,
                color: AppColors.mainBlue,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.mainBlue.withAlpha(50),
                  AppColors.mainBlue.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Iconsax.cpu_charge,
              size: 16.sp,
              color: AppColors.mainBlue,
            ),
          ),
          horizontalSpacing(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2.h),
                  blurRadius: 4.r,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(0),
                horizontalSpacing(4),
                _buildDot(1),
                horizontalSpacing(4),
                _buildDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: AppColors.mainBlue.withAlpha(175),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  Widget _buildInputArea(
    BuildContext context,
    LearningCentreCubit cubit,
    LearningCentreState state,
  ) {
    final isContentReady = cubit.isContentReady &&
        cubit.scriptContent != null &&
        cubit.scriptContent!.isNotEmpty;
    final isLoading = state is LoadingSendMessageToGroqAi;
    final isDisabled = !isContentReady || isLoading;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2.h),
            blurRadius: 8.r,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Show status message when content not ready
            if (!isContentReady)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16.sp,
                      color: Colors.orange.shade600,
                    ),
                    horizontalSpacing(8),
                    Expanded(
                      child: Text(
                        S.of(context).please_wait_for_lesson_content,
                        style: FontHelper.font12lackW400(context).copyWith(
                          color: Colors.orange.shade700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDisabled ? Colors.grey[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: TextFormField(
                      controller: cubit.messageController,
                      enabled: !isDisabled,
                      decoration: InputDecoration(
                        hintText: isContentReady
                            ? S.of(context).type_message
                            : "Please wait...",
                        hintStyle: FontHelper.font12lackW400(context).copyWith(
                          color: AppColors.greyBlue,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (_) =>
                          isDisabled ? null : _handleSendMessage(state, cubit),
                    ),
                  ),
                ),
                horizontalSpacing(8),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDisabled
                          ? [
                              AppColors.grey,
                              AppColors.grey.withAlpha(200),
                            ]
                          : [
                              AppColors.mainBlue,
                              AppColors.mainBlue.withAlpha(200),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2.h),
                        blurRadius: 4.r,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24.r),
                      onTap: isDisabled
                          ? null
                          : () => _handleSendMessage(state, cubit),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Icon(
                          Iconsax.send_1,
                          color: Colors.white,
                          size: 20.sp,
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
    );
  }

  void _handleSendMessage(
      LearningCentreState state, LearningCentreCubit cubit) {
    final text = cubit.messageController.text.trim();
    if (text.isNotEmpty) {
      _sendMessage(text: text, state: state, cubit: cubit);
      cubit.messageController.clear();
    }
  }

  void _sendMessage(
      {required String text,
      required LearningCentreCubit cubit,
      required LearningCentreState state}) {
    cubit.messages.add(ChatMessage(text: text, isUser: true));

    cubit.sendMessageToGroq(text);

    // Scroll to show user message
    _scrollToBottom(cubit);
  }

  void _clearChat(LearningCentreCubit cubit) {
    cubit.clearMessages();
  }

  void _scrollToBottom(LearningCentreCubit cubit) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cubit.scrollController.hasClients) {
        cubit.scrollController.animateTo(
          cubit.scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
