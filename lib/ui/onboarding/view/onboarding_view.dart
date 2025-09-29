import 'package:flutter/material.dart';

import '../../../core/resources/ColorManager.dart';
import '../../home/widgets/tabs/SebhaTab/widgets/custom_header.dart';
import '../data/onboarding_model.dart';
import '../widgets/navigation_bottom.dart';
import '../widgets/onboarding_details.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomHeader(),

              SizedBox(height: height * 0.02),

              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                    pageIndex = value;
                  },
                  itemCount: OnboardingModel.onboardingList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      OnboardingModel.onboardingList[index].imageUrl,
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.05),
              OnboardingDetails(
                onboardingModel: OnboardingModel.onboardingList[pageIndex],
              ),

              SizedBox(height: height * 0.05),
              NavigationBottom(
                pageIndex: pageIndex,
                onboardingModel: OnboardingModel.onboardingList[pageIndex],
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
