import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class StrikethroughPriceCustom extends StatelessWidget {
  const StrikethroughPriceCustom({
    super.key,
    required this.originalPrice,
    this.currency = '\$',
  });

  final double originalPrice;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currency${originalPrice.toStringAsFixed(2)}',
      style: AppTextStyles.font12GreyRegular.copyWith(
        decoration: TextDecoration.lineThrough,
        color: AppColors.grey,
      ),
    );
  }
}
