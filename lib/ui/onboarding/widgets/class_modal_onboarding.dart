import 'package:islami_c16/core/resources/AssetsManager.dart';

class OnBoardingModal {
  final String titleimage;
  final String? descriptionimage;
  final String pngImage;

  const OnBoardingModal({
    this.descriptionimage,
    required this.pngImage,
    required this.titleimage,
  });

  static const  List<OnBoardingModal> onboard = [
    OnBoardingModal(
        titleimage: "Welcome To Islmi App",
        pngImage: AssetsManager.welcomeislmi,
        ),
    OnBoardingModal(
        titleimage: "Welcome To Islmi App",
        pngImage: AssetsManager.welcomemosque,
        descriptionimage: "We Are Very Excited To Have You In Our \n Community"
        ),
    OnBoardingModal(
        titleimage: "Reading the Quran",
        pngImage: AssetsManager.readequran,
        descriptionimage: "Read, and your Lord is the Most Generous"
        ),
    OnBoardingModal(
        titleimage: "Bearish",
        pngImage: AssetsManager.bearish,
        descriptionimage: "Praise the name of your Lord, the Most \n High"
        ),
    OnBoardingModal(
        titleimage: "Holy Quran Radio",
        pngImage: AssetsManager.micRadio,
        descriptionimage: "You can listen to the Holy Quran Radio \n through the application for free and easily"
        ),
  ];
}
