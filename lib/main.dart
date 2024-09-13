import 'package:flutter/material.dart';
import 'package:movies_app_route/home/view/screen/home_screen.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

void main() {

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
