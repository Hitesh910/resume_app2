import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_app/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.red,
  //   systemNavigationBarColor: Colors.blue,
  // ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  );
}
