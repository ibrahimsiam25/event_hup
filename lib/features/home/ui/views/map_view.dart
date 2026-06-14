import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/event/ui/widgets/filter_sheet/filter_bottom_sheet.dart';
import 'package:event_hup/features/home/ui/widgets/map/map_category_chips.dart';
import 'package:event_hup/features/home/ui/widgets/map/map_event_card.dart';
import 'package:event_hup/features/home/ui/widgets/map/map_event_item.dart';
import 'package:event_hup/features/home/ui/widgets/map/map_marker_widget.dart';
import 'package:event_hup/features/home/ui/widgets/map/map_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController _mapController = MapController();
  int _selectedEventIndex = 0;
  final LatLng _defaultCenter = const LatLng(40.7128, -74.0060);
  late final List<MapEventItem> _mapEvents = MapEventsList.get();

  void _onLocate() {
    _mapController.move(_defaultCenter, 14.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _defaultCenter,
                initialZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.event_hup',
                ),
                MarkerLayer(
                  markers: List.generate(_mapEvents.length, (index) {
                    final item = _mapEvents[index];
                    final isSelected = _selectedEventIndex == index;
                    return Marker(
                      point: item.point,
                      width: 60.r,
                      height: 60.r,
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedEventIndex = index);
                          _mapController.move(item.point, 14.0);
                        },
                        child: MapMarkerWidget(
                          icon: item.icon,
                          backgroundColor: item.color,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 12.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              children: [
                MapSearchBar(onLocatePressed: _onLocate),
                SizedBox(height: 12.h),
                const MapCategoryChips(),
              ],
            ),
          ),
          Positioned(
            bottom: 24.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                    width: 50.r,
                    height: 50.r,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: AppColors.white,
                      size: 22.sp,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                MapEventCard(
                  event: _mapEvents[_selectedEventIndex].event,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
