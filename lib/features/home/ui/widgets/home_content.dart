import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/home/data/entities/home_event_entity.dart';
import 'package:event_hup/features/home/ui/widgets/category_chips_list.dart';
import 'package:event_hup/features/home/ui/widgets/explore_header.dart';
import 'package:event_hup/features/home/ui/widgets/invite_banner.dart';
import 'package:event_hup/features/home/ui/widgets/nearby_events_list.dart';
import 'package:event_hup/features/home/ui/widgets/upcoming_events_list.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeContent extends StatelessWidget {
  const 
HomeContent({super.key, 
    required this.upcomingEvents,
    required this.nearbyEvents,
  });
 
  final List<HomeEventEntity> upcomingEvents;
  final List<HomeEventEntity> nearbyEvents;

  @override
  Widget build(BuildContext context) {
    // Standard mock list for skeleton preview
    final safeUpcoming = upcomingEvents.isEmpty
        ? List.generate(
            3,
            (index) => const HomeEventEntity(
              id: 'dummy',
              title: 'Upcoming Concert Title',
              imageUrl: '',
              day: '12',
              month: 'JUN',
              dateLabel: 'Wed, Jun 12',
              location: 'London, UK',
              distanceLabel: '',
            ),
          )
        : upcomingEvents;

    final safeNearby = nearbyEvents.isEmpty
        ? List.generate(
            3,
            (index) => const HomeEventEntity(
              id: 'dummy',
              title: 'Nearby Festival Title',
              imageUrl: '',
              day: '18',
              month: 'JUN',
              dateLabel: 'Sat, Jun 18',
              location: 'New York, USA',
              distanceLabel: '',
            ),
          )
        : nearbyEvents;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
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
          ).animate().fade(duration: 400.ms, delay: 200.ms).slideY(begin: 0.2, end: 0),
          SizedBox(height: 16.h),
          UpcomingEventsList(events: safeUpcoming)
              .animate()
              .fade(duration: 400.ms, delay: 250.ms)
              .slideX(begin: 0.1, end: 0),

          SizedBox(height: 24.h),

          // Invitation Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const InviteBanner(),
          ).animate().fade(duration: 400.ms, delay: 300.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),

          SizedBox(height: 24.h),

          // Nearby You section
          _buildSectionHeader(
            context,
            title: S.of(context).nearbyYou,
            onSeeAll: () {},
          ).animate().fade(duration: 400.ms, delay: 350.ms).slideY(begin: 0.2, end: 0),
          SizedBox(height: 16.h),
          NearbyEventsList(events: safeNearby)
              .animate()
              .fade(duration: 400.ms, delay: 400.ms)
              .slideY(begin: 0.1, end: 0),

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