import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "title": "Welcome To Islami App",
      "subtitle": "",
      "image": AssetsManager.welcome,
    },
    {
      "title": "Welcome To Islami",
      "subtitle": "We Are Very Excited To Have You In Our Community",
      "image": AssetsManager.welcomeMosque,
    },
    {
      "title": "Holy Quran",
      "subtitle": "Read and listen to the Holy Quran anytime",
      "image": AssetsManager.welcomeQuran,
    },
    {
      "title": "Prayer Times",
      "subtitle": "Get accurate prayer times and reminders",
      "image": AssetsManager.welcomeBearish,
    },
    {
      "title": "Holy Quran Radio",
      "subtitle":
          "You can listen to the Holy Quran Radio through the application for free and easily",
      "image": AssetsManager.welcomeRadio,
    },
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } 
  }
    void _finishOnboarding(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_seen', true);
 Navigator.of(context).pushReplacementNamed(RoutesManager.homeRoute);
    
     
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }


   
  

  @override
  Widget build(BuildContext context) {

   //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
                  alignment: Alignment.center,
                  child: Image.asset(AssetsManager.islamiLogo,width: width*0.75,fit: BoxFit.fitWidth,)),
           const SizedBox(height: 40,),
            Expanded(
              child: PageView.builder(

                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset(
                        pages[index]["image"]!,
                        height: 300,
                        color: ColorManager.goldColor,
                      ),

                      const SizedBox(height: 40),

                    
                      Text(
                        pages[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ColorManager.goldColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 40),

                     
                      if (pages[index]["subtitle"]!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            pages[index]["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorManager.goldColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  _currentPage == 0
                      ? const SizedBox(width: 60)
                      : TextButton(
                          onPressed: _prevPage,
                          child: const Text(
                            "Back",
                            style: TextStyle(color: ColorManager.goldColor),
                          ),
                        ),

                  
                  Row(
                    children: List.generate(
                      pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width:  _currentPage == index?  20  :  10 ,
                        height: 8,
                        decoration:
                        _currentPage == index ? 
                          BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           shape: BoxShape.rectangle,
                           color: ColorManager.goldColor
                          )
                        
                        :  const BoxDecoration(
                           shape:    BoxShape.circle,
                           color:ColorManager.grey,
                          ),
                      ),
                    ),
                  ),

                 
                  TextButton(
                    onPressed:(){
                    if (_currentPage == pages.length -1){
                      _finishOnboarding(context);
                    } else{
                     _nextPage();
                    }
                    },
                    child: Text(
                      _currentPage == pages.length - 1 ? "Finish" : "Next",
                      style: const TextStyle(color: ColorManager.goldColor),
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
 
  