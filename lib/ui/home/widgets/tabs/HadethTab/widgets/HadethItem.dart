import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';

import '../../../../../../core/resources/AssetsManager.dart';
import '../../../../../../model/HadethModel.dart';

class HadethItem extends StatelessWidget {
  int index;
  int selectedIndex;
  HadethModel hadeth;
  HadethItem({required this.index , required this.selectedIndex,required this.hadeth});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.hadethRoute,arguments: hadeth);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8,vertical: selectedIndex==index
            ?20
            :40),
        decoration: BoxDecoration(
          color: ColorManager.goldColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 12
              ),
              child: Row(
                children: [
                  Image.asset(AssetsManager.leftHadithCorner,height: height*0.08,
                  matchTextDirection: true,
                  ),
                  Expanded(child: Text(hadeth.title,
                    textAlign:TextAlign.center,
                    style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.blackColor
                  ),)),
                  Image.asset(AssetsManager.rightHadithCorner,height: height*0.08,                  matchTextDirection: true,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AssetsManager.hadeithCardBack),
                    Text(hadeth.content,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Janna LT",
                        height: 1.8,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.blackColor
                    ),)
                  ],
                ),
              ),
            ),
            Image.asset(AssetsManager.hadeithMosque,)
          ],
        ),
      ),
    );
  }
}
