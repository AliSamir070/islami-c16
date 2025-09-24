class OnboardingModel {
  final String imageUrl;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imageUrl: "assets/images/onboarding/welcome1.png",
      title: "Welcome To Islami App",
      subTitle: "",
    ),
    OnboardingModel(
      imageUrl: "assets/images/onboarding/kabba.png",
      title: "Welcome To Islami",
      subTitle: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      imageUrl: "assets/images/onboarding/welcome.png",
      title: "Reading the Quran",
      subTitle: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      imageUrl: "assets/images/onboarding/bearish.png",
      title: "Bearish",
      subTitle: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      imageUrl: "assets/images/onboarding/radio.png",
      title: "Holy Quran Radio",
      subTitle:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
