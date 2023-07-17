import 'package:annotation/utils/gaps/gaps.dart';
import 'package:annotation/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../utils/colors/app_colors.dart';
import '../controller/successful_annotation_controller.dart';

class AnnotationSuccessfulScreen extends StatelessWidget {
  const AnnotationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final annotationSuccessfulController =
        Get.find<SuccessfulAnnotationController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: context.height * 1,
            width: context.width * 1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  annotationSuccessfulController.isNightTime.value
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  100.ph,
                  Container(
                    padding: const EdgeInsets.all(
                      15,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: annotationSuccessfulController.isNightTime.value
                          ? CColors.fontColorBrightBackground
                          : CColors.topLefBrightButtonBackground,
                    ),
                    child: Image.asset(
                      Assets.successAnnotationImageSuccessAnnotationImage,
                      height: 350,
                    ),
                  ),
                  40.ph,
                  Text(
                    "Sikeres Annotacio",
                    style: annotationSuccessfulController.isNightTime.value
                        ? CustomTextStyles.fontBright860
                        : CustomTextStyles.fontDark860,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
