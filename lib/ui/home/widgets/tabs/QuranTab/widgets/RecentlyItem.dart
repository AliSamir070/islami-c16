import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

import '../../../../../../core/resources/AssetsManager.dart';

class RecentlyItem extends StatelessWidget {
  const RecentlyItem({super.key});

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
              Text("Al-Anbiya",style: TextStyle(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text("الأنبياء",style: TextStyle(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text("112 verses",style: TextStyle(
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
