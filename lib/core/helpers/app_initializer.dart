import 'package:bloc/bloc.dart';
import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/core/helpers/app_constants.dart';
import 'package:event_hup/core/helpers/custom_bloc_observer.dart';
import 'package:event_hup/core/helpers/shared_pref_helper.dart';
import 'package:event_hup/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppInitializer {
  static Future<void> initCore() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();
    await setupGetIt();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Bloc.observer = CustomBlocObserver();
  }

  static Future<void> initRouter() async {
    final isNotFirstLogin = await SharedPrefHelper.getBool(
      AppConstants.prefsIsNotFirstLogin,
    );
    
    final prefs = await SharedPreferences.getInstance();
    final hasSession = prefs.getInt('user_id') != null;

    if (!getIt.isRegistered<GoRouter>()) {
      getIt.registerSingleton<GoRouter>(
        AppRouter.getRouter(isNotFirstLogin: isNotFirstLogin, hasSession: hasSession),
      );
    }
  }

}
