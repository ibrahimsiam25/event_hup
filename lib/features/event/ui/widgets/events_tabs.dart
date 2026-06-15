import 'package:event_hup/features/event/data/entities/event_query.dart';
import 'package:event_hup/features/event/ui/view/events_view.dart';
import 'package:event_hup/features/event/ui/widgets/tab_item.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsTabs extends StatelessWidget {
  const EventsTabs({
    super.key,
    required this.selectedTab,
    required this.onChanged,
  });

  final EventListMode   selectedTab;
  final ValueChanged<EventListMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TabItem(
              title: S.of(context).upcoming,
              isSelected: selectedTab == EventListMode.upcoming,
              onTap: () => onChanged(EventListMode.upcoming),
            ),
          ),
          Expanded(
            child: TabItem(
              title: S.of(context).pastEvents,
              isSelected: selectedTab == EventListMode.past,
              onTap: () => onChanged(EventListMode.past),
            ),
          ),
        ],
      ),
    );
  }
}
