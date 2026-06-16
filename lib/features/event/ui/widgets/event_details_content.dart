import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/event/ui/widgets/info_row.dart';
import 'package:event_hup/features/event/ui/widgets/organizer_row.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsContent extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String address;
  final String description;
  final String organizerName;
  final String organizerImageUrl;

  const EventDetailsContent({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.address,
    required this.description,
    required this.organizerName,
    required this.organizerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 46.h),
            Text(title, style: AppTextStyles.font18BlackBold.copyWith(fontSize: 34.sp, height: 1.2)),
            SizedBox(height: 24.h),
            InfoRow(iconData: Icons.calendar_month_outlined, iconBgColor: AppColors.primary.withValues(alpha: 0.12), iconColor: AppColors.primary, title: date, subtitle: time),
            SizedBox(height: 16.h),
            InfoRow(iconData: Icons.location_on_outlined, iconBgColor: AppColors.primary.withValues(alpha: 0.12), iconColor: AppColors.primary, title: venue, subtitle: address),
            SizedBox(height: 16.h),
            OrganizerRow(organizerName: organizerName, organizerImageUrl: organizerImageUrl),
            SizedBox(height: 24.h),
            Text(S.of(context).aboutEvent, style: AppTextStyles.font16BlackSemiBold.copyWith(fontSize: 18.sp)),
            SizedBox(height: 10.h),
            Text(description, style: AppTextStyles.font15BlackRegular.copyWith(fontSize: 15.sp, color: AppColors.greyDark, height: 1.6)),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
