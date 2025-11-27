import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/home/screen/IntroScreen.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenIntro = prefs.getBool('seenIntro') ?? false;

  runApp(MyApp(seenIntro: seenIntro));
}

class MyApp extends StatelessWidget {
  final bool seenIntro;
  const MyApp({super.key, required this.seenIntro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            color: ColorManager.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          )),
        ),
      ),
      routes: {
        RoutesManager.introRoute: (context) => const IntroScreen(),
        RoutesManager.homeRoute: (context) => HomeScreen(),
        RoutesManager.quranRoute: (context) => QuranDetailsScreen(),
      },
      initialRoute:
      seenIntro ? RoutesManager.homeRoute : RoutesManager.introRoute,
    );
  }
}
