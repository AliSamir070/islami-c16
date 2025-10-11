import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/onboarding/onboarding.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              color: ColorManager.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ),

      routes: {
        RoutesManager.onboarding: (context) => OnBoardingScreen(),
        RoutesManager.homeRoute: (context) =>  HomeScreen(),
        RoutesManager.quranRoute: (context) =>  QuranDetailsScreen(),
      },


      initialRoute: RoutesManager.onboarding,
    );
  }
}
