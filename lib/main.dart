import 'package:course_generator/app.dart';
import 'package:course_generator/config/app_pages.dart';
import 'package:course_generator/initializer.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;

  runApp(App(
    initialRoute: initialRoute,
  ));
}
