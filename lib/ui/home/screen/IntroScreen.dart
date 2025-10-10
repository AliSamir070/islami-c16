import 'package:flutter/material.dart';
import '../../../core/resources/AssetsManager.dart';
import '../../../core/resources/ColorManager.dart';
import '../../../core/resources/RoutesManager.dart';
import '../widgets/IntroWidget/IntroPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 4);
                });
              },
              children: const [
                IntroPage(
                  imagePath: AssetsManager.Welcome_Islmi,
                  title: "",
                  subtitle: "Welcome To Islami App",
                ),
                IntroPage(
                  imagePath: AssetsManager.kabba,
                  title: "Welcome To Islami App ",
                  subtitle: "We are very excited to have you in our community",
                ),
                IntroPage(
                  imagePath: AssetsManager.Reading_Quran,
                  title: "Reading the Quran",
                  subtitle: "Read, and your Lord is the Most Generous",
                ),
                IntroPage(
                  imagePath: AssetsManager.Bearish,
                  title: "Bearish",
                  subtitle: "Praise the name of your Lord, the Most High",
                ),
                IntroPage(
                  imagePath: AssetsManager.Quran_Radio,
                  title: "Holy Quran Radio",
                  subtitle:
                      "You can listen to the Holy Quran Radio through the application for free and easily",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (_controller.page! > 0) {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text(
                    "Back",
                    style:
                        TextStyle(color: ColorManager.goldColor, fontSize: 16 , fontWeight: FontWeight.bold
                        ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: const WormEffect(
                    activeDotColor: ColorManager.goldColor,
                    dotColor: ColorManager.Gray,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (onLastPage) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('seenIntro', true);
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.homeRoute);
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    onLastPage ? "Finish" : "Next",
                    style: const TextStyle(
                        color: ColorManager.goldColor, fontSize: 16 , fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
