import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/event/ui/view/events_view.dart';
import 'package:event_hup/features/home/ui/views/home_view.dart' show HomeView;
import 'package:event_hup/features/home/ui/views/mock_map_view.dart';
import 'package:event_hup/features/profile/ui/views/profile_view.dart';
import 'package:event_hup/features/home/ui/widgets/add_event_fab.dart';
import 'package:event_hup/features/home/ui/widgets/custom_navigation_bar.dart';

import 'package:flutter/material.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  static const routerPath = "/bottomNavBarView";

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const EventsView(),
    const MockMapView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: const AddEventFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
