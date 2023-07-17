import 'dart:developer';

import 'package:annotation/models/app_code_models.dart';
import 'package:get/get.dart';
import '../../../services/app_services/app_services.dart';
import '../../annotation_landing/view/annotation_landing_screen.dart';

class SuccessfulAnnotationController extends GetxController {
  final isNightTime = false.obs;

  @override
  void onInit() {
    getThemeValue();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        // Get.offAll(
        //   () => const AnnotationLandingScreen(),
        //   transition: Transition.fadeIn,
        // );
      },
    );
    super.onInit();
  }

  isFromFifthOutputFunction(
      {required FifthOutputCodesModel fifthOutputCodesModel}) {
    log("isFromFifthOutputFunction");
    log(fifthOutputCodesModel.cameraId);
    log(fifthOutputCodesModel.babyId);
    log(fifthOutputCodesModel.nurseId);
    log(fifthOutputCodesModel.babyIncubatorStateId);
    log(fifthOutputCodesModel.whatsHappeningId);
  }

  isFromSixthOutputFunction(
      {required SixthOutputCodesModel sixthOutputCodesModel}) {
    log("isFromFifthOutputFunction");
    log(sixthOutputCodesModel.cameraId);
    log(sixthOutputCodesModel.babyId);
    log(sixthOutputCodesModel.nurseId);
    log(sixthOutputCodesModel.babyIncubatorStateId);
    log(sixthOutputCodesModel.behaviourCode);
    log(sixthOutputCodesModel.babyVoiceCode);
    log(sixthOutputCodesModel.babyMovementHandsCode);
    log(sixthOutputCodesModel.babyMovementLegsCode);
    log(sixthOutputCodesModel.babyBreathingCode);
    log(sixthOutputCodesModel.eyeCode);
  }

  isFromSixthOutPut() {}

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
