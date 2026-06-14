import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_stats_row.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_tab.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_tab_section.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
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
                  Text(
                    'David Silbia',
                    style: AppTextStyles.font18BlackBold.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const ProfileStatsRow(
                    followingCount: '350',
                    followersCount: '346',
                  ),
                  SizedBox(height: 24.h),
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
            const ProfileTabSection(
              initialTab: ProfileTab.reviews,
            ),
          ],
        ),
      ),
    );
  }
}
