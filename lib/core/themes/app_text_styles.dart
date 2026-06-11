import 'package:flutter/material.dart';
import 'app_colors.dart';

class AirbnbCerealTextStyle extends TextStyle {
  const AirbnbCerealTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(fontFamily: 'AirbnbCereal');
}

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle font22WhiteMedium = AirbnbCerealTextStyle(
    fontSize: 22,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    height: 1.545, 
  );
  static const TextStyle font14GreyMedium = AirbnbCerealTextStyle(
    fontSize: 14,
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
    height: 1.545, 
  );

  static const TextStyle font18WhiteMedium = AirbnbCerealTextStyle(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    height: 1.889, 
  );

  static const TextStyle font15WhiteRegular = AirbnbCerealTextStyle(
    fontSize: 15,
    color: AppColors.onboardingSubText,
    fontWeight: FontWeight.w400,
    height: 1.667, 
  );

  static const TextStyle font15BlackRegular = AirbnbCerealTextStyle(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle font18BlackBold = AirbnbCerealTextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle font14PrimaryMedium = AirbnbCerealTextStyle(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font12GreyRegular = AirbnbCerealTextStyle(
    fontSize: 12,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );


  static const TextStyle font16BlackSemiBold = AirbnbCerealTextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle font14PrimaryRegular = AirbnbCerealTextStyle(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
  );
}
