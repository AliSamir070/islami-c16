import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "",
      "subtitle": "Welcome To Islmi App",
      "image": "assets/images/welcome1.png"
    },
    {
      "title": "Welcome To Islami",
      "subtitle": "We Are Very Excited To Have You In Our Community",
      "image": "assets/images/welcome2.png"
    },
    {
      "title": "Reading the Quran",
      "subtitle": "Read, and your Lord is the Most Generous",
      "image": "assets/images/welcome3.png"
    },
    {
      "title": "Bearish",
      "subtitle": " Praise the name of your Lord, the Most High ",
      "image": "assets/images/welcome4.png"
    },
    {
      "title": "Holy Quran Radio",
      "subtitle":
      "You can listen to the Holy Quran Radio through the application for free and easily",
      "image": "assets/images/welcome5.png"
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.islamiLogo,
                  width: width * 0.75,
                  fit: BoxFit.fitWidth,
                )),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          onboardingData[index]["image"].toString(),
                          width: width * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onboardingData[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.goldColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        onboardingData[index]["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.goldColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage == 0
                      ? const SizedBox(width: 60)
                      : TextButton(
                    onPressed: _previousPage,
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.goldColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingData.length, (index) {
                      bool isActive = _currentPage == index;
                      return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 19 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive ?ColorManager.goldColor: Colors.grey ,
                            borderRadius: BorderRadius.circular(12),                           ),
                         );
                    }),),

                  TextButton(
                    onPressed: _currentPage == onboardingData.length - 1
                        ? () {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.homeRoute);
                    }
                        : _nextPage,
                    child: Text(
                      _currentPage == onboardingData.length - 1
                          ? "Finish"
                          : "Next",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.goldColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





















