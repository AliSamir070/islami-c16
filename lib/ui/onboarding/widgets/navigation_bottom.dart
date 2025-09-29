// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islami_c16/ui/onboarding/widgets/navigation_button.dart';
import '../../../core/resources/ColorManager.dart';
import '../../../core/resources/RoutesManager.dart';
import '../data/onboarding_model.dart';

class NavigationBottom extends StatefulWidget {
  int pageIndex;
  OnboardingModel onboardingModel;
  PageController controller;
  NavigationBottom({
    super.key,
    required this.pageIndex,
    required this.onboardingModel,
    required this.controller,
  });

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          NavigationButton(
            title: "Back",
            onPressed: () {
              if (widget.pageIndex > 0 &&
                  widget.pageIndex <= OnboardingModel.onboardingList.length) {
                setState(() {
                  widget.controller.previousPage(
                    duration: Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              }
            },
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(OnboardingModel.onboardingList.length, (
                index,
              ) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.controller.jumpToPage(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: width * 0.03),
                    height: 8,
                    width: widget.pageIndex == index ? 24 : 8,

                    decoration: BoxDecoration(
                      color: widget.pageIndex == index
                          ? ColorManager.goldColor
                          : ColorManager.onboardingIndicatorColor,
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                );
              }),
            ),
          ),

          widget.pageIndex == OnboardingModel.onboardingList.length - 1
              ? NavigationButton(
                  title: "Finish",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.homeRoute,
                    );
                  },
                )
              : NavigationButton(
                  title: "Next",
                  onPressed: () {
                    if (widget.pageIndex <
                            OnboardingModel.onboardingList.length &&
                        widget.pageIndex >= 0) {
                      setState(() {
                        widget.controller.nextPage(
                          duration: Duration(milliseconds: 1),
                          curve: Curves.linear,
                        );
                      });
                    }
                  },
                ),
        ],
      ),
    );
  }
}
