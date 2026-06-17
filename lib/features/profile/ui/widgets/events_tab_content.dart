import 'package:event_hup/features/event/data/services/favorites_service.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:event_hup/features/event/ui/widgets/event_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsTabContent extends StatelessWidget {
  const EventsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventEntity>>(
      stream: FavoritesService.favoritesStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
          return FutureBuilder<List<EventEntity>>(
            future: FavoritesService.getFavoriteEvents(),
            builder: (context, futureSnapshot) {
              if (futureSnapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.all(24.w),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              return _buildList(futureSnapshot.data ?? []);
            },
          );
        }
        
        return _buildList(snapshot.data ?? []);
      },
    );
  }

  Widget _buildList(List<EventEntity> favoriteEvents) {
    if (favoriteEvents.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(24.w),
        child: Center(
          child: Text(
            'No favorite events yet',
            style: AppTextStyles.font15BlackRegular,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 12.h,left: 12.w,right: 12.w),
      itemCount: favoriteEvents.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          child: EventListTile(event: favoriteEvents[index]),
        );
      },
    );
  }
}
