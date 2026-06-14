import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/event/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventListTile extends StatelessWidget {
  final EventMockData event;

  const EventListTile({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Side: Event Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: event.image,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: AppColors.greyLight),
              errorWidget: (context, url, error) => Container(
                color: AppColors.greyLight,
                child: Icon(Icons.broken_image, color: AppColors.grey, size: 24.sp),
              ),
            ),
          ),
          SizedBox(width: 14.w),

          // Right Side: Time and Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (event.time != null)
                  Text(
                    event.time!.toUpperCase(),
                    style: AppTextStyles.font14PrimaryMedium.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: 4.h),
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font16BlackSemiBold.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
