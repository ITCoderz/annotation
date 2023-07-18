import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:annotation/screens/splash_screen/controller/splash_controller.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/text_styles/text_styles.dart';
import '../../annotation_landing/view/annotation_landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    return Scaffold(
      body: Obx(() {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                splashController.isNightTime.value
                    ? Assets
                        .splashScreenBackgroundImageSplashScreenBackgroundImage
                    : Assets.splashScreenSplashScreenLightModeBackground,
              ),
              fit: BoxFit.fill,
            ),
          ),
          height: context.height * 1,
          width: context.width * 1,
          child: AnimatedSplashScreen(
            splash: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: splashController.isNightTime.value
                        ? CColors.fontColorBrightBackground
                        : CColors.topLefBrightButtonBackground,
                  ),
                  child: Image.asset(
                    Assets.splashLogoAppSplashLogo,
                    height: 250,
                    width: 250,
                    color: CColors.blackColor,
                  ),
                ),
                30.ph,
                RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "MTA ",
                        style: CustomTextStyles.black450,
                      ),
                      TextSpan(
                        text: "SZTAKI",
                        style: CustomTextStyles.black750,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            centered: true,
            nextScreen: const AnnotationLandingScreen(),
            disableNavigation: false,
            splashIconSize: context.height * 1,
            splashTransition: SplashTransition.sizeTransition,
            animationDuration: const Duration(milliseconds: 2000),
            duration: 2500,
            backgroundColor: Colors.transparent,
          ),
        );
      }),
    );
  }
}
