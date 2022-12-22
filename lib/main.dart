import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieScreen(),
    );
  }
}
