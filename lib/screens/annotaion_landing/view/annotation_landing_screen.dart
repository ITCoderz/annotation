import 'package:annotation/reusable_widgets/buttons/custom_elevated_button.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../selection/view/selection_screen.dart';

class AnnotationLandingScreen extends StatelessWidget {
  const AnnotationLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height * 1,
          width: context.width * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.splashScreenBackgroundImageSplashScreenBackgroundImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                100.ph,
                Image.asset(
                  Assets.landingScreenImagesLandingScreenLogo,
                  height: 300,
                ),
                30.ph,
                CustomElevatedButton(
                  onPressedFunction: () {
                    Get.to(
                      () => const SelectionScreen(),
                      transition: Transition.fadeIn,
                    );
                  },
                  buttonText: "Annotalas",
                  width: context.width * 0.3,
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
