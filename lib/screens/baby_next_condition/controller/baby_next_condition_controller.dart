import 'package:annotation/models/app_code_models.dart';
import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';
import '../../successful_annotation/view/annotation_successful_screen.dart';

class BabyNextConditionController extends GetxController {
  final isNightTime = false.obs;
  final behaviourCode = "6.10".obs;
  final babyVoiceCode = "6.20".obs;
  final babyMovementHandsCode = "6.30".obs;
  final babyMovementLegsCode = "6.30".obs;

  final babyBreathingCode = "6.40".obs;
  final eyeCode = "6.50".obs;

  setBehaviourCode({required String code}) {
    if (behaviourCode.value == code) {
      behaviourCode.value = "6.10";
    } else {
      behaviourCode.value = code;
    }
  }

  setVoiceCode({required String code}) {
    if (babyVoiceCode.value == code) {
      babyVoiceCode.value = "6.20";
    } else {
      babyVoiceCode.value = code;
    }
  }

  setHandMovementCode({required String code}) {
    if (babyMovementHandsCode.value == code) {
      babyMovementHandsCode.value = "6.30";
    } else {
      babyMovementHandsCode.value = code;
    }
  }

  setLegMovementCode({required String code}) {
    if (babyMovementLegsCode.value == code) {
      babyMovementLegsCode.value = "6.30";
    } else {
      babyMovementLegsCode.value = code;
    }
  }

  setBreathingCode({required String code}) {
    if (babyBreathingCode.value == code) {
      babyBreathingCode.value = "6.30";
    } else {
      babyBreathingCode.value = code;
    }
  }

  setEyeCode({required String code}) {
    if (eyeCode.value == code) {
      eyeCode.value = "6.30";
    } else {
      eyeCode.value = code;
    }
  }

  @override
  void onInit() {
    getThemeValue();

    super.onInit();
  }

  setAllBabyCodesAndNavigateValues({
    required FifthOutputCodesModel fifthOutputCodesModel,
  }) {
    SixthOutputCodesModel sixthOutputCodesModel = SixthOutputCodesModel(
      cameraId: fifthOutputCodesModel.cameraId,
      babyId: fifthOutputCodesModel.babyId,
      nurseId: fifthOutputCodesModel.nurseId,
      babyIncubatorStateId: fifthOutputCodesModel.babyIncubatorStateId,
      whatsHappeningId: fifthOutputCodesModel.whatsHappeningId,
      behaviourCode: behaviourCode.value,
      babyVoiceCode: babyVoiceCode.value,
      babyMovementHandsCode: babyMovementHandsCode.value,
      babyMovementLegsCode: babyMovementLegsCode.value,
      babyBreathingCode: babyBreathingCode.value,
      eyeCode: eyeCode.value,
    );
    Get.offAll(
      () => AnnotationSuccessfulScreen(
        sixthOutputCodesModel: sixthOutputCodesModel,
      ),
      transition: Transition.fadeIn,
    );
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
