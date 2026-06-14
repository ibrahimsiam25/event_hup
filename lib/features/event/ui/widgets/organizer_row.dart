import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/event/ui/view/organizer_profile_view.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrganizerRow extends StatelessWidget {
  const OrganizerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.push(OrganizerProfileView.routerPath),
          child: Row(
            children: [
              // Organizer avatar
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: const Color(0xFF6B4F3A),
                ),
                child: Icon(Icons.person, color: AppColors.white, size: 26.sp),
              ),
              SizedBox(width: 14.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'David Silbia',
                    style: AppTextStyles.font16BlackSemiBold.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Organizer',
                    style: AppTextStyles.font12GreyRegular.copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
        ),

        const Spacer(),

        // Follow button
       GestureDetector(
  onTap: () {},
  child: Container(
    padding: EdgeInsets.symmetric(
      horizontal: 18.w,
      vertical: 8.h,
    ),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(7.r),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(
            74,
            210,
            228,
            0.08,
          ),
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Text(
    S.of(context).follow,
   style: AppTextStyles.font12GreyRegular.copyWith(
        color: AppColors.primary
      )
    ),
  ),
)
      ],
    );
  }
}
