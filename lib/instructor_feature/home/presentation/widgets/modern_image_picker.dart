import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/helpers/modern_dialog_sheet.dart';
import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';

import '../../../../generated/l10n.dart';

class ModernImagePicker extends StatefulWidget {
  final String label;
  final Function(File?)? onImageSelected;
  final HomeInstructorCubit cubit;

  const ModernImagePicker({
    super.key,
    required this.label,
    this.onImageSelected,
    required this.cubit,
  });

  @override
  State<ModernImagePicker> createState() => _ModernImagePickerState();
}

class _ModernImagePickerState extends State<ModernImagePicker> {
  Future<void> _showImageSourceDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog Title
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.mainBlue.withAlpha(30),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Iconsax.gallery,
                        color: AppColors.mainBlue,
                        size: 24.sp,
                      ),
                    ),
                    horizontalSpacing(12),
                    Expanded(
                      child: Text(
                        S.of(context).select_image_source,
                        style: FontHelper.font15BlackW600(context).copyWith(
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                verticalSpacing(24),

                // Camera Option
                _buildSourceOption(
                  icon: Iconsax.camera,
                  title: S.of(context).camera,
                  subtitle: S.of(context).take_a_new_photo,
                  onTap: () => _pickImage(ImageSource.camera),
                ),

                verticalSpacing(12),

                // Gallery Option
                _buildSourceOption(
                  icon: Iconsax.gallery,
                  title: S.of(context).gallery,
                  subtitle: S.of(context).choose_from_gallery,
                  onTap: () => _pickImage(ImageSource.gallery),
                ),

                if (widget.cubit.selectedImage != null) ...[
                  verticalSpacing(12),
                  // Remove Image Option
                  _buildSourceOption(
                    icon: Iconsax.trash,
                    title: S.of(context).remove_image,
                    subtitle: S.of(context).clear_current_selection,
                    onTap: _removeImage,
                    isDestructive: true,
                  ),
                ],

                verticalSpacing(20),

                // Cancel Button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.grey.withAlpha(150),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(
                            color: Colors.grey.withAlpha(80),
                          )),
                    ),
                    child: Text(
                      S.of(context).cancel,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSourceOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDestructive
                ? Colors.red.withAlpha(70)
                : Colors.grey.withAlpha(80),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isDestructive
                    ? Colors.red.withAlpha(30)
                    : AppColors.mainBlue.withAlpha(30),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: isDestructive ? Colors.red : AppColors.mainBlue,
                size: 20.sp,
              ),
            ),
            horizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: isDestructive ? Colors.red : null,
                    ),
                  ),
                  verticalSpacing(2),
                  Text(
                    subtitle,
                    style: FontHelper.font12lackW400(context).copyWith(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Iconsax.arrow_right_3,
              color: Colors.grey[600],
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await widget.cubit.picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          widget.cubit.selectedImage = File(pickedFile.path);
        });

        if (widget.onImageSelected != null) {
          widget.onImageSelected!(widget.cubit.selectedImage);
        }
      }
    } catch (e) {
      ModernDialogSheet.showError(
          context: context,
          title: S.of(context).error,
          message: "${S.of(context).something_went_wrong}: $e");
    }
  }

  void _removeImage() {
    setState(() {
      widget.cubit.selectedImage = null;
    });

    if (widget.onImageSelected != null) {
      widget.onImageSelected!(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainBlue.withAlpha(30),
                    AppColors.mainBlue.withAlpha(20),
                  ],
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Iconsax.gallery,
                color: AppColors.mainBlue,
                size: 16.sp,
              ),
            ),
            horizontalSpacing(10),
            Text(
              widget.label,
              style: FontHelper.font15BlackW600(context).copyWith(
                color: AppColors.darkBlue,
              ),
            ),
          ],
        ),
        verticalSpacing(8),

        // Image Picker Container
        GestureDetector(
          onTap: _showImageSourceDialog,
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              color: widget.cubit.selectedImage != null
                  ? Colors.transparent
                  : AppColors.mainBlue.withAlpha(15),
              border: Border.all(
                color: widget.cubit.selectedImage != null
                    ? AppColors.mainBlue.withAlpha(100)
                    : AppColors.mainBlue.withAlpha(60),
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                if (widget.cubit.selectedImage != null)
                  BoxShadow(
                    color: AppColors.mainBlue.withAlpha(30),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: widget.cubit.selectedImage != null
                ? _buildImagePreview()
                : widget.cubit.selectedImageUrl != null
                    ? _buildImagePreviewFromUrl()
                    : _buildPlaceholder(),
          ),
        ),

        verticalSpacing(16),
      ],
    );
  }

  Widget _buildImagePreview() {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: Image.file(
            widget.cubit.selectedImage!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // Overlay with edit button
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withAlpha(100),
              ],
            ),
          ),
        ),

        // Edit Icon
        Positioned(
          top: 12.h,
          right: 12.w,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(240),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Iconsax.edit,
              color: AppColors.mainBlue,
              size: 16.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePreviewFromUrl() {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: CachedNetworkImage(
            imageUrl: widget.cubit.selectedImageUrl!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // Overlay with edit button
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withAlpha(100),
              ],
            ),
          ),
        ),

        // Edit Icon
        Positioned(
          top: 12.h,
          right: 12.w,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(240),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Iconsax.edit,
              color: AppColors.mainBlue,
              size: 16.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Upload Icon with Animation
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.gallery_add,
              color: AppColors.mainBlue,
              size: 32.sp,
            ),
          ),

          verticalSpacing(8),

          // Title
          Text(
            S.of(context).add_image,
            style: FontHelper.font15BlackW600(context).copyWith(
              fontSize: 16.sp,
              color: AppColors.mainBlue,
            ),
          ),

          verticalSpacing(4),

          // Subtitle
          Text(
            S.of(context).tap_to_select_an_image_from_camera_or_gallery,
            textAlign: TextAlign.center,
            style: FontHelper.font12lackW400(context).copyWith(
              color: Colors.grey[600],
              fontSize: 12.sp,
            ),
          ),

          verticalSpacing(8),

          // Supported formats
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'JPG, PNG, JPEG',
              style: FontHelper.font12lackW400(context).copyWith(
                color: Colors.grey[600],
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
