import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/model/SuraModel.dart';

import '../../../../../../core/resources/AssetsManager.dart';

class RecentlyItem extends StatelessWidget {
  SuraModel sura;
  RecentlyItem(this.sura);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: ColorManager.goldColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(sura.suraNameEn,style: TextStyle(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text(sura.suraNameAr,style: TextStyle(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text("${sura.versesNumber} verses",style: TextStyle(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),),
            ],
          ),
          Image.asset(AssetsManager.quranRecently)
        ],
      ),
    );
  }
}
