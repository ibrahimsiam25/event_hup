import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_network_image.dart';
import 'package:event_hup/core/widgets/custom_text_button.dart';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:event_hup/features/event/ui/widgets/attendees_row.dart';
import 'package:event_hup/features/event/ui/widgets/info_row.dart';
import 'package:event_hup/features/event/ui/widgets/organizer_row.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, this.event});

  final EventEntity? event;

  @override
  Widget build(BuildContext context) {
    final hasEvent = event != null;
    final title = hasEvent ? event!.title : 'Concert Title Loading...';
    final date = hasEvent ? event!.dateLabel : '14 December, 2021';
    final time = hasEvent ? event!.timeLabel : 'Tuesday, 4:00PM - 9:00PM';
    final venue = hasEvent ? event!.venue : 'Gala Convention Center';
    final address = hasEvent ? event!.address : '36 Guild Street London, UK';
    final description = hasEvent ? event!.description : 'Enjoy your favorite dishes and spend a lovely time...';
    final organizerName = hasEvent ? event!.organizer : 'David Silbia';
    final organizerImageUrl = hasEvent ? event!.organizerImageUrl : '';
    final imageUrl = hasEvent ? event!.imageUrl : '';
    final priceLabel = hasEvent ? event!.priceLabel : '\$120';
    final ticketUrl = hasEvent ? event!.ticketUrl : '';

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
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
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              title: Text(
                S.of(context).eventDetails,
                style: AppTextStyles.font18WhiteMedium.copyWith(
                  fontSize: 18.sp,
                ),
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
                      Icons.bookmark_border,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (imageUrl.isNotEmpty)
                      CustomNetworkImage(imageUrl: imageUrl)
                    else
                      Container(color: AppColors.primaryLight),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 120.h,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.black.withValues(alpha: 0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 46.h),
                    Text(
                      title,
                      style: AppTextStyles.font18BlackBold.copyWith(
                        fontSize: 34.sp,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InfoRow(
                      iconData: Icons.calendar_month_outlined,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.12),
                      iconColor: AppColors.primary,
                      title: date,
                      subtitle: time,
                    ),
                    SizedBox(height: 16.h),
                    InfoRow(
                      iconData: Icons.location_on_outlined,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.12),
                      iconColor: AppColors.primary,
                      title: venue,
                      subtitle: address,
                    ),
                    SizedBox(height: 16.h),
                    OrganizerRow(
                      organizerName: organizerName,
                      organizerImageUrl: organizerImageUrl,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      S.of(context).aboutEvent,
                      style: AppTextStyles.font16BlackSemiBold.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      description,
                      style: AppTextStyles.font15BlackRegular.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.greyDark,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
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
        ),
      ],
    );
  }
}
