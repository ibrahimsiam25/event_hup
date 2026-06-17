import 'package:event_hup/features/event/data/services/favorites_service.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_network_image.dart';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:event_hup/features/event/ui/widgets/attendees_row.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsAppBar extends StatefulWidget {
  final EventEntity event;

  const EventDetailsAppBar({super.key, required this.event});

  @override
  State<EventDetailsAppBar> createState() => _EventDetailsAppBarState();
}

class _EventDetailsAppBarState extends State<EventDetailsAppBar> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final fav = await FavoritesService.isFavorite(widget.event.id);
    if (mounted) setState(() => isFavorite = fav);
  }

  Future<void> _toggleFavorite() async {
    await FavoritesService.toggleFavorite(widget.event);
    _checkFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      expandedHeight: 220.h,
      pinned: true,
      backgroundColor: AppColors.primaryDark,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Transform.translate(
            offset: Offset(0, 28.h),
            child: const AttendeesRow(),
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          margin: EdgeInsets.all(8.r),
          child: Icon(Icons.arrow_back, color: AppColors.white, size: 24.sp),
        ),
      ),
      title: Text(
        S.of(context).eventDetails,
        style: AppTextStyles.font18WhiteMedium.copyWith(fontSize: 18.sp),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: AppColors.white,
              size: 20.sp,
            ),
            onPressed: _toggleFavorite,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.event.imageUrl.isNotEmpty)
              CustomNetworkImage(imageUrl: widget.event.imageUrl)
            else
              Container(color: AppColors.primaryLight),
            Positioned(
              bottom: 0, left: 0, right: 0, height: 120.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.black.withValues(alpha: 0.7), Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
