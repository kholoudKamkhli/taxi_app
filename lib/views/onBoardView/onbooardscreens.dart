import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

import '../signUpViews/signUpView.dart';

class OnboardScreens extends StatelessWidget {
static const String routeName = "onboardscreens";
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // go to login;
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // go to login;
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color:Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 18,
          color: Colors.black54,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: CupertinoColors.inactiveGray,
          activeColor: Color.fromARGB(255, 76, 229, 177),
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignUpView.routeName);
          },
          child: const Text(
            "Skip",
            style: TextStyle(color: const Color.fromARGB(255, 76, 229, 177),),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state,context),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 76, 229, 177),
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState,var context) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
        Navigator.pushReplacementNamed(context, SignUpView.routeName);
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Request Ride",
    description: "Request a ride and get picked up by a nearby driver",
    imgUrl: "assets/images/img_1.png",
  ),
  const OnBoardModel(
    title: "Confirm your driver",
    description:
    "huge drivers Network helps finding comfortable, safe and cheap ride",
    imgUrl: 'assets/images/img_2.png',
  ),
  const OnBoardModel(
    title: "Track your ride",
    description:
    "Know your driver in advace and be able to view current location on google maps!",
    imgUrl: 'assets/images/img_3.png',
  ),
];