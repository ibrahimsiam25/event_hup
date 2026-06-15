import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_network_image.dart';
import 'package:event_hup/features/event/ui/view/event_details_view.dart';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EventListTile extends StatelessWidget {
  final EventEntity event;

  const EventListTile({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/eventDetailsView/${event.id}');
      },
      child: Container(
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
            SizedBox(
              width: 80.w,
              height: 80.h,
              child: CustomNetworkImage(
                imageUrl: event.imageUrl,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(width: 14.w),

            // Right Side: Time, Title and Location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    event.timeLabel,
                    style: AppTextStyles.font14PrimaryMedium.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font16BlackSemiBold.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 4.h),
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
                          event.locationLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.font12GreyRegular.copyWith(
                            fontSize: 11.sp,
                            color: AppColors.grey,
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
      ),
    );
  }
}
