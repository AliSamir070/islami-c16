import 'package:flutter/material.dart';
import 'package:islami_c16/model.dart';
import 'package:islami_c16/ui/home/screen/home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Islami> onBoardings = [
    Islami("assets/images/welcome.png", "", "Welcome To Islmi App"),
    Islami(
      "assets/images/mosquee.png",
      "Welcome To Islami",
      "We Are Very Excited To Have You In Our Community",
    ),
    Islami(
      "assets/images/moshaf.png",
      "Reading the Quran",
      "Read, and your Lord is the Most Generous",
    ),
    Islami(
      "assets/images/Two_hands.png",
      "Bearish",
      "Praise the name of your Lord, the Most High",
    ),
    Islami(
      "assets/images/microphone.png",
      "Holy Quran Radio",
      "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff202020),
        title: Center(child: Image.asset("assets/images/Islami.png")),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 95),
            Container(
              height: 300,
              width: 370,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardings.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    onBoardings[index].image!,
                    //width: 200,
                    //height: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 60),
            Text(
              textAlign: TextAlign.center,
              onBoardings[_currentPage].text1!,
              style: TextStyle(
                color: Color(0xffE2BE7F),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 45),
            Text(
              textAlign: TextAlign.center,
              onBoardings[_currentPage].text2!,
              style: TextStyle(
                color: Color(0xffE2BE7F),
                fontSize: 17,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text("Back", style: TextStyle(color: Color(0xffE2BE7F))),
            Spacer(),
            (_currentPage == 4)
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text("Finish",
                        style: TextStyle(color: Color(0xffE2BE7F))))
                : Text("Next", style: TextStyle(color: Color(0xffE2BE7F))),
          ],
        ),
      ),
    );
  }
}
