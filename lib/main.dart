import 'package:event_hup/core/helpers/app_initializer.dart';
import 'package:event_hup/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInitializer.initCore();
  await AppInitializer.initRouter();
  runApp(const MyApp());
}
