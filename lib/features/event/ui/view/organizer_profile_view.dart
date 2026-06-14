import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/profile/ui/widgets/about_tab_content.dart';
import 'package:event_hup/features/profile/ui/widgets/events_tab_content.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_stats_row.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_tab.dart';
import 'package:event_hup/features/profile/ui/widgets/reviews_tab_content.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizerProfileView extends StatefulWidget {
  const OrganizerProfileView({super.key});

  static const routerPath = "/organizerProfileView";

  @override
  State<OrganizerProfileView> createState() => _OrganizerProfileViewState();
}

class _OrganizerProfileViewState extends State<OrganizerProfileView> {
  ProfileTab _activeTab = ProfileTab.reviews;
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Details Area
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                // Profile Avatar
                Center(
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
                      child: CachedNetworkImage(
                        imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400',
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
                SizedBox(height: 16.h),

                // Name
                Text(
                  'David Silbia',
                  style: AppTextStyles.font18BlackBold.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),

                // Stats Row
                const ProfileStatsRow(
                  followingCount: '350',
                  followersCount: '346',
                ),
                SizedBox(height: 24.h),

                // Buttons Action Row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isFollowing = !_isFollowing;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFollowing ? AppColors.greyLight : AppColors.primary,
                          foregroundColor: _isFollowing ? AppColors.black : AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isFollowing ? Icons.person_outline : Icons.person_add_alt_1_outlined,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              _isFollowing ? 'Following' : S.of(context).followBtn,
                              style: AppTextStyles.font14PrimaryMedium.copyWith(
                                color: _isFollowing ? AppColors.black : AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.chat_bubble,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              S.of(context).messagesBtn,
                              style: AppTextStyles.font14PrimaryMedium.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),

          // Tab Bar Selector
          _buildTabBar(),

          // Active tab body
          Expanded(
            child: Container(
              color: AppColors.greyBackground,
              child: _buildTabContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem(ProfileTab.about, S.of(context).aboutTab),
            _buildTabItem(ProfileTab.event, S.of(context).eventTab),
            _buildTabItem(ProfileTab.reviews, S.of(context).reviewsTab),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1.h,
          color: AppColors.greyLight,
        ),
      ],
    );
  }

  Widget _buildTabItem(ProfileTab tab, String label) {
    final isSelected = _activeTab == tab;
    return InkWell(
      onTap: () {
        setState(() {
          _activeTab = tab;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.primary : AppColors.grey,
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 60.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.r),
                  topRight: Radius.circular(3.r),
                ),
              ),
            )
          else
            SizedBox(height: 3.h),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_activeTab) {
      case ProfileTab.about:
        return const AboutTabContent();
      case ProfileTab.event:
        return const EventsTabContent();
      case ProfileTab.reviews:
        return const ReviewsTabContent();
    }
  }
}
