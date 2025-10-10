import 'package:flutter/material.dart';
import 'package:islami_c16/core/PrefsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';
import 'package:islami_c16/ui/quran_details/screen/quran_details_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        RoutesManager.hadethRoute:(context)=>HadethDetailsScreen()
      },
      initialRoute:RoutesManager.homeRoute ,
    );
  }
}

