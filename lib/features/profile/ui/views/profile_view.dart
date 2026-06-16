import 'package:event_hup/core/helpers/auth_service.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_header_section.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_tab.dart';
import 'package:event_hup/features/profile/ui/widgets/profile_tab_section.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> _logout(BuildContext context) async {
    await AuthService().logout();
    if (context.mounted) {
      context.go('/signIn');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).profile,
          style: AppTextStyles.font18BlackBold.copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.black),
            onPressed: () => _logout(context),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.black),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileHeaderSection(),
            ProfileTabSection(
              initialTab: ProfileTab.about,
            ),
          ],
        ),
      ),
    );
  }
}
