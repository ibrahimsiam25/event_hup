import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/event/ui/widgets/event_list_tile.dart';
import 'package:event_hup/features/event/ui/widgets/event_mock_data.dart';
import 'package:event_hup/features/event/ui/widgets/filter_sheet/filter_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static const routerPath = "/searchView";

  @override
  State<SearchView> createState() => _SearchViewViewState();
}

class _SearchViewViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<EventMockData> _filteredEvents = [];

  @override
  void initState() {
    super.initState();
    _filteredEvents = EventMockDataLists.upcomingEvents;
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredEvents = EventMockDataLists.upcomingEvents;
      } else {
        _filteredEvents = EventMockDataLists.upcomingEvents
            .where((event) => event.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.black, size: 26.sp),
        ),
        title: Text(
          'Search',
          style: AppTextStyles.font18BlackBold.copyWith(fontSize: 22.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            _buildSearchRow(context),
            SizedBox(height: 24.h),
            Expanded(
              child: _filteredEvents.isEmpty
                  ? Center(
                      child: Text(
                        'No results found',
                        style: AppTextStyles.font12GreyRegular.copyWith(fontSize: 16.sp),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredEvents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: EventListTile(event: _filteredEvents[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.search, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 8.w),
              Container(width: 1.w, height: 20.h, color: AppColors.greyLight),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterSearch,
                  style: AppTextStyles.font15BlackRegular.copyWith(fontSize: 16.sp),
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => const FilterBottomSheet(),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppColors.white.withValues(alpha: 0.15),
                  child: Icon(
                    CupertinoIcons.slider_horizontal_3,
                    color: AppColors.white,
                    size: 12.sp,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  'Filters',
                  style: AppTextStyles.font15WhiteRegular.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
