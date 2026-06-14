import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomAppBar(
          color: AppColors.white,
          elevation: 0,
          notchMargin: 10,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(
                  context: context,
                  index: 0,
                  icon: CupertinoIcons.compass,
                  activeIcon: CupertinoIcons.compass_fill,
                  label: S.of(context).explore,
                ),
                _buildBottomNavItem(
                  context: context,
                  index: 1,
                  icon: CupertinoIcons.calendar,
                  activeIcon: CupertinoIcons.calendar_today,
                  label: S.of(context).events,
                ),
                SizedBox(width: 48.w), // Space for FAB
                _buildBottomNavItem(
                  context: context,
                  index: 2,
                  icon: CupertinoIcons.map,
                  activeIcon: CupertinoIcons.map_fill,
                  label: S.of(context).map,
                ),
                _buildBottomNavItem(
                  context: context,
                  index: 3,
                  icon: CupertinoIcons.person,
                  activeIcon: CupertinoIcons.person_fill,
                  label: S.of(context).profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? AppColors.primary : AppColors.grey;
    
    return InkWell(
      onTap: () => onTap(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: 64.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: color,
              size: 22.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: isSelected
                  ? AppTextStyles.font14PrimaryMedium.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    )
                  : AppTextStyles.font12GreyRegular.copyWith(
                      fontSize: 11.sp,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
