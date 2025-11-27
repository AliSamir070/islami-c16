import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c16/core/resources/AppConstants.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/StringsManager.dart';
import 'package:islami_c16/ui/home/widgets/tabs/QuranTab/widgets/RecentlyItem.dart';
import 'package:islami_c16/ui/home/widgets/tabs/QuranTab/widgets/SuraItem.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.quranBack),fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(AssetsManager.islamiLogo,width: width*0.75,fit: BoxFit.fitWidth,)),
              SizedBox(height: 20,),
              TextField(
                cursorColor: ColorManager.textfieldColor,
                style: TextStyle(
                  color: ColorManager.textfieldColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                decoration: InputDecoration(
                  hintText: StringsManager.suraName,
                  hintStyle: TextStyle(
                      color: ColorManager.textfieldColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 90,
                    maxWidth: 90
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      AssetsManager.quranIcon,
                      height: 28,
                      width: 28,
                      colorFilter: ColorFilter.mode(
                          ColorManager.goldColor,
                          BlendMode.srcIn
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:ColorManager.goldColor ,
                          width: 1
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:ColorManager.goldColor ,
                          width: 1
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:ColorManager.goldColor ,
                      width: 1
                    )
                  )
                ),
              ),
              SizedBox(height: 20,),
              Text(StringsManager.mostRecently,style: TextStyle(
                color: ColorManager.textfieldColor,
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
              SizedBox(
                height: height*0.16,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => RecentlyItem(),
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                    itemCount: 10),
              ),
              SizedBox(height: 10,),
              Text(StringsManager.surasList,style: TextStyle(
                  color: ColorManager.textfieldColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.separated(
                    itemBuilder:(context, index) => SuraItem(AppConstants.surasList[index]) ,
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: Divider(),
                    ),
                    itemCount: AppConstants.surasList.length
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
