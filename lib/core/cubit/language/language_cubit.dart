
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../helpers/app_constants.dart';
import '../../helpers/shared_pref_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()) {
    loadSavedLanguage();
  }

  bool? isArabic;
  bool? isFirstLogin;

  Future<void> loadSavedLanguage() async {
 
    bool hasLanguagePreference = await SharedPrefHelper.containsKey(
      AppConstants.isArabic,
    );

    if (hasLanguagePreference) {
      isArabic = await SharedPrefHelper.getBool(AppConstants.isArabic);
    } else {
      isArabic = true;
      await SharedPrefHelper.setData(AppConstants.isArabic, true);
    }

    emit(LanguageChanged(isArabic!));
  }

  String get locale => (isArabic ?? true) ? "ar" : "en";

  void toggleLanguage() async {
    isFirstLogin = true;
    isArabic = !isArabic!;
    await SharedPrefHelper.setData(AppConstants.isArabic, isArabic);
    emit(LanguageChanged(isArabic!));
  }
}
