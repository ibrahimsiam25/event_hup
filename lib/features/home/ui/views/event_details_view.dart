import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/home/ui/widgets/event_details_view_body.dart';
import 'package:flutter/material.dart';




class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});
  static const routerPath = "/eventDetailsView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: EventDetailsViewBody(),
    );
  }
}
