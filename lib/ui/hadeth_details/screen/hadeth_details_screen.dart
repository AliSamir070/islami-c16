import 'package:flutter/material.dart';
import 'package:islami_c16/model/HadethModel.dart';

import '../../../core/resources/AssetsManager.dart';
import '../../../core/resources/ColorManager.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.goldColor),
        title: Text(
          "Hadith ${hadeth.number}",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: ColorManager.goldColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.leftCorner,height: 92,width: 92,),
                    Text(
                      hadeth.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: ColorManager.goldColor),
                    ),
                    Image.asset(AssetsManager.rightCorner,height: 92,width: 92,),
                  ],),
                SizedBox(height: 3,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(hadeth.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          height: 2.5,
                          color: ColorManager.goldColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ],),
            ),
          ),
          Image.asset(AssetsManager.mosque)
        ],
      ),
    );
  }
}
