import 'package:event_hup/core/cubit/connection/connection_cubit.dart';
import 'package:event_hup/core/cubit/language/language_cubit.dart';
import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/widgets/no_connection_overlay.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.white.withValues(alpha: 0),
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => ConnectionCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              LanguageCubit cubit = context.read<LanguageCubit>();
              return Directionality(
                textDirection: cubit.locale == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: MaterialApp.router(
                  theme: ThemeData.light(),
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Locale(cubit.locale),
                  debugShowCheckedModeBanner: false,
                  routerConfig: getIt<GoRouter>(),
                  builder: (context, child) {
                    return Stack(
                      children: [
                        child ?? const SizedBox.shrink(),
                        const NoConnectionOverlay(),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
