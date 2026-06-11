import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';



class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (!kReleaseMode){
          log('${bloc.runtimeType} $transition');
    }

  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (!kReleaseMode){
          log('${bloc.runtimeType} $error');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (!kReleaseMode) {
      log('${bloc.runtimeType} $change');
    }
  }
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (!kReleaseMode) {
      log('${bloc.runtimeType} closed');
    }
  }
}
