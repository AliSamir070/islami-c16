import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/model/HadethModel.dart';
import 'package:islami_c16/ui/home/widgets/tabs/HadethTab/widgets/HadethItem.dart';

import '../../../../../core/resources/AssetsManager.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  PageController controller = PageController(viewportFraction: 0.8,);

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    loadAhadethFile();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.blackColor,
          image: DecorationImage(image: AssetImage(AssetsManager.hadethBack),alignment: Alignment.topCenter)
      ),
      child: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AssetsManager.islamiLogo,width: width*0.75,fit: BoxFit.fitWidth,)),
          SizedBox(height: 35,),
          Expanded(
              child: ahadethList.isEmpty
                  ?Center(child: CircularProgressIndicator(color: ColorManager.goldColor,),)
                  :Directionality(
            textDirection: TextDirection.rtl,
            child: PageView.builder(

                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                controller: controller,
                itemBuilder:(context, index) => HadethItem(
                  hadeth: ahadethList[index],
                  selectedIndex: selectedIndex,index: index,) ,
                itemCount:ahadethList.length ,
            ),
          )
          )
        ],
      ),
    );
  }
  List<HadethModel> ahadethList = [];
  loadAhadethFile()async{
    print("Load ahadeth function");
    String allAhadeth =  await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethTextList = allAhadeth.split("#");
    for(int i=0;i<ahadethTextList.length;i++){
      List<String> lines = ahadethTextList[i].trim().split("\n");
      print(lines);
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join(" ");
      HadethModel hadethModel = HadethModel(title: title, content: content,number: i+1);
      ahadethList.add(hadethModel);
    }
    setState(() {

    });
  }
}
