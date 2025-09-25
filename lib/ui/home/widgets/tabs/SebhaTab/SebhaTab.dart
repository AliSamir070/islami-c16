import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _turns = 0;
  int _counter = 0;
  int _currentDhikr = 0;

  final List<String> _adhkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
  ];

  void _onTapSebha() {
    setState(() {
      _turns += 1;
      _counter++;

      if (_counter > 30) {
        _counter = 1;
        _currentDhikr++;
        if (_currentDhikr >= _adhkar.length) {
          _currentDhikr = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 750,
            child: Image(
              image: AssetImage("assets/images/sebha_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 750,
            width: 500,
            child: Image(
              image: AssetImage("assets/images/second_layer.png"),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  //  alignment: Alignment.topCenter,
                  "assets/images/islami.png",
                  color: Color(0xffE2BE7F),
                ),
              ),
              SizedBox(height: 55),
              const Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              Container(
                height: 66,
                width: 73,
                child: Image(
                  image: AssetImage("assets/images/Mask.png"),
                ),
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: _onTapSebha,
                    child: AnimatedRotation(
                      turns: _turns,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        "assets/images/SebhaBody.png",
                        height: 300,
                        width: 463,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 110),
                      Center(
                        child: Text(
                          _adhkar[_currentDhikr],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('$_counter',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
