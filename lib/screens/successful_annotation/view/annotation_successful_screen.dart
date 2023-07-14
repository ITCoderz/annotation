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
   final  annotationSuccessfulController =Get.find<SuccessfulAnnotationController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height * 1,
          width: context.width * 1,
          alignment: Alignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                100.ph,
                Container(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CColors.fontColorBrightBackground,
                  ),
                  child: Image.asset(
                    Assets.successAnnotationImageSuccessAnnotationImage,
                    height: 350,
                  ),
                ),
                40.ph,
                const Text(
                  "Sikeres Annotacio",
                  style: CustomTextStyles.fontBright650,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
