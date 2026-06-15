
import 'package:event_hup/core/widgets/custom_error_state.dart';
import 'package:event_hup/features/home/ui/widgets/home_content.dart';
import 'package:event_hup/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading && state.upcomingEvents.isEmpty) {
          return const Skeletonizer(
            enabled: true,
            child: HomeContent(
              upcomingEvents: [],
              nearbyEvents: [],
            ),
          );
        }
        if (state.status == HomeStatus.failure && state.upcomingEvents.isEmpty) {
          return CustomErrorState(
            errorMessage: state.errorMessage,
            onRetry: () => context.read<HomeCubit>().load(),
          );
        }
        return RefreshIndicator(
          onRefresh: () => context.read<HomeCubit>().load(),
          child: HomeContent(
            upcomingEvents: state.upcomingEvents,
            nearbyEvents: state.nearbyEvents,
          ),
        );
      },
    );
  }
}
