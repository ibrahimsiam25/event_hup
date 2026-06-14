import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestData {
  final String name;
  final Color color;

  InterestData({
    required this.name,
    required this.color,
  });
}

class AboutTabContent extends StatefulWidget {
  const AboutTabContent({super.key});

  @override
  State<AboutTabContent> createState() => _AboutTabContentState();
}

class _AboutTabContentState extends State<AboutTabContent> {
  bool _isAboutExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<InterestData> interests = [
      InterestData(name: S.of(context).gamesOnline, color: const Color(0xFF5669FF)),
      InterestData(name: S.of(context).concert, color: const Color(0xFFED6A5E)),
      InterestData(name: S.of(context).music, color: const Color(0xFFF9A11B)),
      InterestData(name: S.of(context).art, color: const Color(0xFF46CDFB)),
      InterestData(name: S.of(context).movie, color: const Color(0xFF29D697)),
      InterestData(name: S.of(context).others, color: const Color(0xFF00F0FF)),
    ];

    const aboutText = 'Enjoy your favorite dishe and a lovely your friends and family and have a great time. '
        'Food from local food trucks will be available for purchase.';

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).aboutMe,
            style: AppTextStyles.font18BlackBold.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              style: AppTextStyles.font15BlackRegular.copyWith(
                fontSize: 15.sp,
                color: AppColors.greyDark,
                height: 1.6,
              ),
              children: [
                TextSpan(
                  text: _isAboutExpanded
                      ? aboutText
                      : (aboutText.length > 85 ? '${aboutText.substring(0, 85)}...' : aboutText),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isAboutExpanded = !_isAboutExpanded;
                      });
                    },
                    child: Text(
                      _isAboutExpanded ? '  ${S.of(context).readLess} ▴' : '  ${S.of(context).readMore} ▾',
                      style: AppTextStyles.font14PrimaryMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).interest,
                style: AppTextStyles.font18BlackBold.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: AppColors.primary,
                        size: 10.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        S.of(context).changeBtn,
                        style: AppTextStyles.font14PrimaryMedium.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: interests.map((interest) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: interest.color,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  interest.name,
                  style: AppTextStyles.font15WhiteRegular.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
