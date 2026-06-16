import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/widgets/custom_text_button.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsBottomBar extends StatelessWidget {
  final String priceLabel;
  final String ticketUrl;

  const EventDetailsBottomBar({
    super.key,
    required this.priceLabel,
    required this.ticketUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: CustomTextButton(
          text: '${S.of(context).buyTicket} $priceLabel',
          onPressed: () async {
            if (ticketUrl.isNotEmpty) {
              final uri = Uri.tryParse(ticketUrl);
              if (uri != null) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            }
          },
        ),
      ),
    );
  }
}
