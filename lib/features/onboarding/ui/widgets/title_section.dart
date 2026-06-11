import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String description;
  const TitleSection({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.font22WhiteMedium,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyles.font15WhiteRegular,
        ),
      ],
    );
  }
}
