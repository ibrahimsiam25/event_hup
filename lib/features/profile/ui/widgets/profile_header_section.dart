import 'package:event_hup/features/auth/data/services/auth_service.dart';
import 'package:event_hup/core/database/database_helper.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_avatar.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_stats_row.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeaderSection extends StatefulWidget {
  const ProfileHeaderSection({super.key});

  @override
  State<ProfileHeaderSection> createState() => _ProfileHeaderSectionState();
}

class _ProfileHeaderSectionState extends State<ProfileHeaderSection> {
  String? _userName;
  String? _imagePath;
  int? _userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await AuthService().getCurrentUser();
    if (user != null) {
      setState(() {
        _userId = user['id'];
        _userName = user['name'];
        _imagePath = user['imagePath'];
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null && _userId != null) {
      await DatabaseHelper.instance.updateUserImage(_userId!, pickedFile.path);
      setState(() => _imagePath = pickedFile.path);
    }
  }

  void _showImagePickerModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          ProfileAvatar(
            imagePath: _imagePath,
            onTap: _showImagePickerModal,
          ),
          SizedBox(height: 16.h),
          Text(
            _userName ?? 'Guest',
            style: AppTextStyles.font18BlackBold.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          const ProfileStatsRow(
            followingCount: '350',
            followersCount: '346',
          ),
          SizedBox(height: 24.h),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.edit_note_outlined,
                  color: AppColors.primary,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  S.of(context).editProfile,
                  style: AppTextStyles.font14PrimaryMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
