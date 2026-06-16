import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onTap;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 96.r,
          height: 96.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48.r),
            child: imagePath != null
                ? Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: AppColors.greyLight),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.greyLight,
                      child: Icon(Icons.person, color: AppColors.grey, size: 40.sp),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
