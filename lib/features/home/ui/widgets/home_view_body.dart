import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_error_state.dart';
import 'package:event_hup/features/home/data/entities/home_event_entity.dart';
import 'package:event_hup/features/home/ui/widgets/category_chips_list.dart';
import 'package:event_hup/features/home/ui/widgets/explore_header.dart';
import 'package:event_hup/features/home/ui/widgets/invite_banner.dart';
import 'package:event_hup/features/home/ui/widgets/nearby_events_list.dart';
import 'package:event_hup/features/home/ui/widgets/upcoming_events_list.dart';
import 'package:event_hup/features/home/logic/cubit/home_cubit.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading && state.upcomingEvents.isEmpty) {
          return const Skeletonizer(
            enabled: true,
            child: _HomeContent(
              upcomingEvents: [],
              nearbyEvents: [],
            ),
          );
        }
        if (state.status == HomeStatus.failure && state.upcomingEvents.isEmpty) {
          return CustomErrorState(
            errorMessage: state.errorMessage,
            onRetry: () => context.read<HomeCubit>().load(),
          );
        }
        return RefreshIndicator(
          onRefresh: () => context.read<HomeCubit>().load(),
          child: _HomeContent(
            upcomingEvents: state.upcomingEvents,
            nearbyEvents: state.nearbyEvents,
          ),
        );
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
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
          ),
          SizedBox(height: 16.h),
          UpcomingEventsList(events: safeUpcoming),

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
          NearbyEventsList(events: safeNearby),

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