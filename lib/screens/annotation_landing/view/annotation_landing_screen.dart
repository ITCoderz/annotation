import 'package:annotation/reusable_widgets/buttons/custom_elevated_button.dart';
import 'package:annotation/screens/annotation_landing/controller/annotation_landing_controller.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../selection/view/selection_screen.dart';

class AnnotationLandingScreen extends StatelessWidget {
  const AnnotationLandingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final annotationController = Get.find<AnnotationController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: context.height * 1,
            width: context.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  annotationController.isNightTime.value
                      ? Assets
                          .splashScreenBackgroundImageSplashScreenBackgroundImage
                      : Assets.splashScreenSplashScreenLightModeBackground,
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
                    width: context.width * 0.4,
                    height: 100,
                    isDark: annotationController.isNightTime.value,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
