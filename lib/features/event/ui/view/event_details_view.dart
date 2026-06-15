import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/widgets/custom_error_state.dart';
import 'package:event_hup/features/event/ui/widgets/event_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../logic/cubit/event_details_cubit.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key, required this.eventId});

  static const routerPath = "/eventDetailsView/:eventId";

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<EventDetailsCubit, EventDetailsState>(
        builder: (context, state) {
          if (state.status == DetailsStatus.loading ||
              state.status == DetailsStatus.initial) {
            return const Skeletonizer(
              enabled: true,
              child: EventDetailsViewBody(),
            );
          }
          if (state.status == DetailsStatus.failure || state.event == null) {
            return CustomErrorState(
              errorMessage: state.errorMessage,
              onRetry: () => context.read<EventDetailsCubit>().load(eventId),
            );
          }
          return EventDetailsViewBody(event: state.event!);
        },
      ),
    );
  }
}
