import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/onboarding/screen/onboarding_screen.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

   final seen = prefs.getBool('onboarding_seen') ?? false;


  runApp(MyApp(seen: seen));
}

class MyApp extends StatelessWidget {
  final bool seen ;
  const MyApp({super.key, required this.seen});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',   
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle:  WidgetStatePropertyAll (TextStyle(                     
            color: ColorManager.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 12
          ))
        )
      ),
      routes: {
        RoutesManager.homeRoute:(context) => HomeScreen(),
        RoutesManager.onboardingRoute:(context) => const OnBoardingScreen(),
        RoutesManager.quranRoute:(context)=>QuranDetailsScreen(),
      

      },
     // initialRoute:RoutesManager.homeRoute ,

      home: seen ?  HomeScreen() : const OnBoardingScreen() ,
    );
  }
}

