import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/StringsManager.dart';
import 'package:islami_c16/ui/home/widgets/tabs/HadethTab/HadethTab.dart';
import 'package:islami_c16/ui/home/widgets/tabs/QuranTab/QuranTab.dart';
import 'package:islami_c16/ui/home/widgets/tabs/RadioTab/RadioTab.dart';
import 'package:islami_c16/ui/home/widgets/tabs/SebhaTab/SebhaTab.dart';
import 'package:islami_c16/ui/home/widgets/tabs/TimeTab/TimeTab.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorManager.goldColor,
        indicatorColor: ColorManager.blackColor.withOpacity(0.6),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.quranIcon,
                colorFilter: ColorFilter.mode(ColorManager.blackColor, BlendMode.srcIn),
              ),
              label: StringsManager.quran,
              selectedIcon: SvgPicture.asset(AssetsManager.quranIcon,
                colorFilter: ColorFilter.mode(ColorManager.whiteColor, BlendMode.srcIn),
              ),
          ),
          NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.hadethIcon,
                colorFilter: ColorFilter.mode(ColorManager.blackColor, BlendMode.srcIn),
              ),
              label: StringsManager.hadith,
              selectedIcon: SvgPicture.asset(AssetsManager.hadethIcon,
                colorFilter: ColorFilter.mode(ColorManager.whiteColor, BlendMode.srcIn),
              ),
          ),
          NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.sebhaIcon,
                colorFilter: ColorFilter.mode(ColorManager.blackColor, BlendMode.srcIn),
              ),
              label: StringsManager.sebha,
              selectedIcon: SvgPicture.asset(AssetsManager.sebhaIcon,
                colorFilter: ColorFilter.mode(ColorManager.whiteColor, BlendMode.srcIn),
              ),
          ),
          NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.radioIcon,
                colorFilter: ColorFilter.mode(ColorManager.blackColor, BlendMode.srcIn),
              ),
              label: StringsManager.radio,
              selectedIcon: SvgPicture.asset(AssetsManager.radioIcon,
                colorFilter: ColorFilter.mode(ColorManager.whiteColor, BlendMode.srcIn),
              ),
          ),
          NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.timeIcon,
                colorFilter: ColorFilter.mode(ColorManager.blackColor, BlendMode.srcIn),
              ),
              label: StringsManager.time,
              selectedIcon: SvgPicture.asset(AssetsManager.timeIcon,
                colorFilter: ColorFilter.mode(ColorManager.whiteColor, BlendMode.srcIn),
              ),
          ),
        ],

      ),
      body: tabs[selectedIndex],
    );
  }
}
