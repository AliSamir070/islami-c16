import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/StringsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>  with SingleTickerProviderStateMixin{
 int counter =0;
 int currentThikrIndex =0;

final List<String> athkar =[
   "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
];

late final AnimationController _controller ;
late Animation<double> _rotation;
double _currentAngle =0.0;


@override
  void initState (){
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    

      );
    _rotation = Tween<double>(begin: 0, end: 0 ).animate(_controller);
  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }


  void onTapSebha (){
    
    setState(() {
      counter++;
 });
      final double step = 12* math.pi / 180;
      final double nextAngle = _currentAngle + step;
      

      _rotation = Tween<double>(
        begin: _currentAngle,
        end: nextAngle,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

      _currentAngle = nextAngle;
        if (counter == 33) {
        counter = 0;
        currentThikrIndex++;
        if (currentThikrIndex == athkar.length) {
          currentThikrIndex = 0;
        }
        }
   
    
    _controller.forward(from: 0);
    
  }

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return 
    Stack(
      children: [
        Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage( AssetsManager.backgroundSebhaTab,), fit: BoxFit.fill),
         
        ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
               Color.fromRGBO(32, 32, 32, 0.6),
            //   Color.fromRGBO(32, 32, 32, 0.7),
               Color.fromRGBO(32, 32, 32, 1),
              ])
          )
        ),



       SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(AssetsManager.islamiLogo,width: width*0.75,fit: BoxFit.fitWidth,)),
           const   SizedBox(height: 20,),

            const  Text(StringsManager.tasbihText,  
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: ColorManager.whiteColor)
            ) ,
             const   SizedBox(height: 95,),
          

             
                 Stack( 
                  alignment: Alignment.center,
                   clipBehavior: Clip.none,
                   children: [
                     Positioned(
                      top: -68,
                      child: Image.asset(AssetsManager.sebhaMedal, width: 140, height: 80 ,)),
                      
                       Column(
                         children: [
                           Text(athkar[currentThikrIndex], style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700,  color: ColorManager.whiteColor),),              
                           Text((counter + 1).toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700,  color: ColorManager.whiteColor),),
                         ],
                       ),              
                      GestureDetector(
                     onTap: onTapSebha,
                     child: AnimatedBuilder(
                      
                      animation: _rotation, 
                      builder: (_, child){
                        return  Transform.rotate(
                        origin:const Offset(0, 0),
                        angle: _rotation.value,
                        child:   Image.asset(AssetsManager.sebhaBody, width: double.infinity, height: height* 0.4, ), 
                                     );
                      },)
                     ),
                   ],
                 )
            
               
                
             
            
        
        


            
            ]
        ),
        
        
        ))

      ],
    );
  }
}
