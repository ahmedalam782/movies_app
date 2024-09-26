import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app_route/home/view/screen/home_screen.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

import 'firebase_options.dart';
import 'movies_category_details/view/screens/category_details.dart';
import 'movies_details/view/screens/movie_details_new.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        MovieDetailsNew.routeName: (_) => const MovieDetailsNew(),
        CategoryDetails.routeName: (_) => const CategoryDetails(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
