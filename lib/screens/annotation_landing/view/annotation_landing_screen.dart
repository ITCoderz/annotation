import 'package:annotation/screens/annotation_landing/controller/annotation_landing_controller.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../services/app_services/app_services.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/text_styles/text_styles.dart';
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
          return Center(
            child: Ink(
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
              child: InkWell(
                onTap: () async {
                  bool networkStatus = await AppServices.internetConnectivity();
                  if (networkStatus) {
                    Get.offAll(
                      () => const SelectionScreen(),
                      transition: Transition.fadeIn,
                    );
                  } else {
                    Get.snackbar(
                      "nem sikerült",
                      "Nincs internetkapcsolat.",
                      colorText: CColors.whiteColor,
                      backgroundColor: Colors.red,
                    );
                  }
                },
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
                      Container(
                        height: 100,
                        width: context.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: annotationController.isNightTime.value
                              ? CColors.fontColorBrightBackground
                              : CColors.topLefBrightButtonBackground,
                        ),
                        child: FittedBox(
                          child: Text(
                            "Annotalas",
                            style: annotationController.isNightTime.value
                                ? CustomTextStyles.fontBlack650
                                : CustomTextStyles.fontLightButton650,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
