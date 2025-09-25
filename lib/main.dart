import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/on_boarding.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                  fontSize: 12)))),
      routes: {RoutesManager.homeRoute: (context) => OnBoarding()},
      initialRoute: RoutesManager.homeRoute,
    );
  }
}
