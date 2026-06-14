import 'package:event_hup/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapCategoryChips extends StatefulWidget {
  const MapCategoryChips({super.key});

  @override
  State<MapCategoryChips> createState() => _MapCategoryChipsState();
}

class _MapCategoryChipsState extends State<MapCategoryChips> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Sports', 'icon': Icons.sports_basketball_outlined},
    {'name': 'Music', 'icon': Icons.music_note_outlined},
    {'name': 'Food', 'icon': Icons.restaurant_outlined},
    {'name': 'Art', 'icon': Icons.palette_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.white : AppColors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    _categories[index]['icon'],
                    color: isSelected ? AppColors.error : AppColors.grey,
                    size: 16.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    _categories[index]['name'],
                    style: TextStyle(
                      color: isSelected ? AppColors.black : AppColors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
