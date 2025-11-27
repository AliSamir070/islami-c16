import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/model/SuraModel.dart';

class QuranDetailsScreen extends StatefulWidget {

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context){
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(suraText.isEmpty){
      loadFile(suraModel.suraNumber);
    } // non blocking
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.goldColor),
        title: Text(
          suraModel.suraNameEn,
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
                      suraModel.suraNameAr,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: ColorManager.goldColor),
                    ),
                    Image.asset(AssetsManager.rightCorner,height: 92,width: 92,),
                  ],),
                SizedBox(height: 3,),
                Expanded(
                  child: suraText.isEmpty
                      ? Center(child: CircularProgressIndicator(color: ColorManager.goldColor,))
                      :SingleChildScrollView(
                    child: Text(suraText,
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

  int add(int n1 , int n2){
    return n1 + n2;
  }

  // isolate
  String suraText = "";

  loadFile(int suraNumber) async { // = future
    int sum=add(8,7);
    String suraData = await rootBundle.loadString("assets/files/Suras/$suraNumber.txt");
    List<String> lines = suraData.split("\n");
    for(int i =0;i<lines.length;i++){
      suraText = suraText + lines[i].trim();
      suraText+= "(${i+1})";
    }
    setState(() {

    });
    print(suraText);
  }
}
