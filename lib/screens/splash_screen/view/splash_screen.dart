import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/text_styles/text_styles.dart';
import '../../annotaion_landing/view/annotation_landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.splashScreenBackgroundImageSplashScreenBackgroundImage,
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CColors.fontColorBrightBackground,
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
                      style: CustomTextStyles.mBlack450,
                    ),
                    TextSpan(
                      text: "SZTAKI",
                      style: CustomTextStyles.mBlack750,
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
      ),
    );
  }
}
