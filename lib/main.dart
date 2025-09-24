import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/home/screen/onboarding_screen.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
final prefs=await SharedPreferences.getInstance();
final seenOnboarding =prefs.getBool('seenOnboarding')??false;
 runApp( MyApp(seenOnboarding : seenOnboarding));
}

class MyApp extends StatelessWidget {
  bool seenOnboarding ;
   MyApp({super.key , required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.homeRoute:(context) => HomeScreen(),
        RoutesManager.quranRoute:(context)=>QuranDetailsScreen(),
        RoutesManager.onboardingRoute:(context)=>OnboardingScreen()
      },
      home: seenOnboarding ? HomeScreen() : OnboardingScreen(),
    );
  }
}
