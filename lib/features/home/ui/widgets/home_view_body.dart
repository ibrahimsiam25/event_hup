import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/home/ui/widgets/category_chips_list.dart';
import 'package:event_hup/features/event/ui/widgets/event_card.dart';
import 'package:event_hup/features/home/ui/widgets/explore_header.dart';
import 'package:event_hup/features/home/ui/widgets/invite_banner.dart';
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
          _buildUpcomingEventsList(),

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
          _buildNearbyEventsList(),

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

  Widget _buildUpcomingEventsList() {
    final List<EventMockData> events = [
      EventMockData(
        title: 'International Band Music Concert',
        image: 'https://images.unsplash.com/photo-1506157786151-b8491531f063?q=80&w=400',
        date: '10',
        month: 'JUNE',
        address: '36 Guild Street London, UK',
      ),
      EventMockData(
        title: "Jo Malone London's Mother's Day Concert",
        image: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?q=80&w=400',
        date: '12',
        month: 'JUNE',
        address: 'Radius Gallery London, UK',
      ),
      EventMockData(
        title: 'Gala Art Exhibition & Gallery Day',
        image: 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?q=80&w=400',
        date: '15',
        month: 'JUNE',
        address: 'Convention Center New York, USA',
      ),
    ];

    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
    );
  }

  Widget _buildNearbyEventsList() {
    final List<EventMockData> events = [
      EventMockData(
        title: 'Food & Wine Festival',
        image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=400',
        date: '18',
        month: 'JUNE',
        address: 'Central Park, New York',
      ),
      EventMockData(
        title: 'Summer Sports Championship',
        image: 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=400',
        date: '22',
        month: 'JUNE',
        address: 'MetLife Stadium, NJ',
      ),
      EventMockData(
        title: 'Jazz Music Under the Stars',
        image: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?q=80&w=400',
        date: '25',
        month: 'JUNE',
        address: 'Broadway Theatre, NY',
      ),
    ];

    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
    );
  }
}