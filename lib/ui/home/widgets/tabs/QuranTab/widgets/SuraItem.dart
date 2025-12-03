import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/model/SuraModel.dart';

class SuraItem extends StatelessWidget {
  SuraModel suraModel;
  SuraItem(this.suraModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.quranRoute,arguments: suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.quranNumber,height: 52,width: 52,),
              Text(suraModel.suraNumber.toString(),style: TextStyle(
                color: ColorManager.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),)
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style: TextStyle(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                ),),
                Text("${suraModel.versesNumber} Verses",style: TextStyle(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                ),),
              ],
            ),
          ),
          Text(suraModel.suraNameAr,style: TextStyle(
              color: ColorManager.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),)
        ],
      ),
    );
  }
}
