import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  final EventMockData event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.w,
      margin: EdgeInsets.only(right: 16.w, bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: event.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: AppColors.greyLight),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.greyLight,
                      child: Icon(Icons.broken_image, color: AppColors.grey, size: 30.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font16BlackSemiBold.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      _buildOverlapAvatarsRow(context),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.grey,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              event.address,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.font12GreyRegular.copyWith(
                                fontSize: 11.sp,
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
            // Date Badge
            Positioned(
              left: 10.w,
              top: 10.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.date,
                      style: AppTextStyles.font18BlackBold.copyWith(
                        color: AppColors.error,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      event.month,
                      style: AppTextStyles.font12GreyRegular.copyWith(
                        color: AppColors.error,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Favorite Button
            Positioned(
              right: 10.w,
              top: 10.h,
              child: Container(
                width: 30.r,
                height: 30.r,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.bookmark,
                    color: AppColors.error,
                    size: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlapAvatarsRow(BuildContext context) {
    final avatarColors = [
      const Color(0xFFED6A5E),
      const Color(0xFFF9A11B),
      const Color(0xFF61C554),
    ];

    return Row(
      children: [
        SizedBox(
          width: 52.w,
          height: 22.h,
          child: Stack(
            children: List.generate(avatarColors.length, (i) {
              return Positioned(
                left: (i * 14).w,
                child: Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: avatarColors[i],
                    border: Border.all(color: AppColors.white, width: 1.5),
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                    size: 12.sp,
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          '+20 Going',
          style: AppTextStyles.font14PrimaryMedium.copyWith(
            fontSize: 11.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class EventMockData {
  final String title;
  final String image;
  final String date;
  final String month;
  final String address;
  final String? time;

  EventMockData({
    required this.title,
    required this.image,
    required this.date,
    required this.month,
    required this.address,
    this.time,
  });
}
