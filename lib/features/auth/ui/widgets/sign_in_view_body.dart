import 'package:event_hup/features/auth/ui/widgets/sign_in_header.dart';
import 'package:event_hup/features/auth/ui/widgets/sign_in_form.dart';
import 'package:event_hup/features/auth/ui/widgets/sign_in_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          const Center(child: SignInHeader()),
          SizedBox(height: 30.h),
          const SignInForm(),
          SizedBox(height: 24.h),
          const SignInFooter(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
