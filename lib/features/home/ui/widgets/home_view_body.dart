import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/home/ui/widgets/category_chips_list.dart';
import 'package:event_hup/features/home/ui/widgets/explore_header.dart';
import 'package:event_hup/features/home/ui/widgets/invite_banner.dart';
import 'package:event_hup/features/home/ui/widgets/nearby_events_list.dart';
import 'package:event_hup/features/home/ui/widgets/upcoming_events_list.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Stack(
            clipBehavior: Clip.none,
            children: [
              ExploreHeader(),
              Positioned(
                bottom: -24,
                left: 0,
                right: 0,
                height: 48,
                child: CategoryChipsList(),
              ),
            ],
          ),
          SizedBox(height: 48.h),

          // Upcoming Events section
          _buildSectionHeader(
            context,
            title: S.of(context).upcomingEvents,
            onSeeAll: () {},
          ),
          SizedBox(height: 16.h),
          const UpcomingEventsList(),

          SizedBox(height: 24.h),

          // Invitation Banner
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: InviteBanner(),
          ),

          SizedBox(height: 24.h),

          // Nearby You section
          _buildSectionHeader(
            context,
            title: S.of(context).nearbyYou,
            onSeeAll: () {},
          ),
          SizedBox(height: 16.h),
          const NearbyEventsList(),

          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    required VoidCallback onSeeAll,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.font18BlackBold.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Row(
              children: [
                Text(
                  S.of(context).seeAll,
                  style: AppTextStyles.font14GreyMedium.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: AppColors.grey,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}