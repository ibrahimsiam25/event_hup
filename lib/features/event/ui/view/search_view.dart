import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_empty_state.dart';
import 'package:event_hup/core/widgets/custom_error_state.dart';
import 'package:event_hup/features/event/ui/widgets/event_list_tile.dart';
import 'package:event_hup/features/event/ui/widgets/filter_sheet/filter_bottom_sheet.dart';
import 'package:event_hup/features/event/logic/cubit/search_cubit.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static const routerPath = "/searchView";

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Infinite scroll triggers at ~70% of list height
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.7) {
      context.read<SearchCubit>().loadMore();
    }
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
        title: Text(S.of(context).exploreEvents, style: AppTextStyles.font18BlackBold.copyWith(fontSize: 22.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            _buildSearchRow(context),
            SizedBox(height: 24.h),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.status == SearchStatus.loading && state.events.isEmpty) {
                    return const Skeletonizer(
                      enabled: true,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state.status == SearchStatus.failure && state.events.isEmpty) {
                    return CustomErrorState(
                      errorMessage: state.errorMessage,
                      onRetry: () => context.read<SearchCubit>().refresh(),
                    );
                  }
                  if (state.events.isEmpty) {
                    return CustomEmptyState(
                      title: 'No results found',
                      message: 'No events match your search query.',
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () => context.read<SearchCubit>().refresh(),
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.events.length + (state.isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.events.length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: const Center(child: CircularProgressIndicator()),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: EventListTile(event: state.events[index]),
                        );
                      },
                    ),
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
                  onChanged: context.read<SearchCubit>().keywordChanged,
                  style: AppTextStyles.font15BlackRegular.copyWith(fontSize: 16.sp),
                  decoration: InputDecoration(
                    hintText: S.of(context).searchHint,
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
                  child: Icon(CupertinoIcons.slider_horizontal_3, color: AppColors.white, size: 12.sp),
                ),
                SizedBox(width: 6.w),
                Text(
                  S.of(context).filters,
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
