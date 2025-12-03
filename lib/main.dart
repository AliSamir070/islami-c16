import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/onboarding/onboardingTap.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool("seenonboarding")??false;

  runApp( MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key,required this.seenOnboarding});

  // This widget is the root of your application.
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
            fontSize: 12
          ))
        )
      ),
      routes: {
        RoutesManager.homeRoute:(context) => HomeScreen(),
        RoutesManager.quranRoute:(context)=>QuranDetailsScreen(),
        RoutesManager.onboardingscreen:(context) => OnBoardingScreen(),
      },
      initialRoute:seenOnboarding?RoutesManager.homeRoute: RoutesManager.onboardingscreen ,
    );
  }
}

