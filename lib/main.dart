import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/home/screen/onboarding_screen.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';

void main()  {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.homeRoute:(context) => HomeScreen(),
        RoutesManager.quranRoute:(context)=>QuranDetailsScreen(),
        RoutesManager.onboardingRoute:(context)=>OnboardingScreen()
      },
      home: OnboardingScreen(),
    );
  }
}
