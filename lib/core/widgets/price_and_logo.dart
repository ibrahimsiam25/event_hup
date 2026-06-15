import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class PriceAndLogo extends StatelessWidget {
  const PriceAndLogo({
    super.key,
    required this.price,
    this.currency = '\$',
  });

  final double price;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.confirmation_number_outlined,
          color: AppColors.primary,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          '$currency${price.toStringAsFixed(2)}',
          style: AppTextStyles.font14PrimaryMedium,
        ),
      ],
    );
  }
}
