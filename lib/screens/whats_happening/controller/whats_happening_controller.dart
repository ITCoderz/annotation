import 'package:annotation/models/app_code_models.dart';
import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';
import '../../baby_next_condition/view/baby_next_condition_screen.dart';
import '../../successful_annotation/view/annotation_successful_screen.dart';

class WhatsHappeningController extends GetxController {
  final isNightTime = false.obs;
  String whatsHappeningId = "";

  @override
  void onInit() {
    getThemeValue();

    super.onInit();
  }

  setWhatsHappeningStateIdAndNavigate({
    required String babyIncubatorStateId,
    required String cameraId,
    required String babyId,
    required String nurseId,
    required String whatsHappeningId,
  }) {
    Get.to(
      () => BabyNextConditionScreen(
        fifthOutputCodesModel: FifthOutputCodesModel(
            cameraId: cameraId,
            babyId: babyId,
            nurseId: nurseId,
            babyIncubatorStateId: babyIncubatorStateId,
            whatsHappeningId: whatsHappeningId),
      ),
      transition: Transition.fadeIn,
    );
  }

  navigateToSendOutputScreen({
    required String babyIncubatorStateId,
    required String cameraId,
    required String babyId,
    required String nurseId,
    String? whatsHappeningId,
  }) {
    if (whatsHappeningId != null) {
      Get.offAll(
        () => AnnotationSuccessfulScreen(
          codesModel: OutputCodesModel(
              cameraId: cameraId,
              babyId: babyId,
              nurseId: nurseId,
              babyIncubatorStateId: babyIncubatorStateId,
              whatsHappeningId: whatsHappeningId,
              behaviourCode: "6.10",
              babyVoiceCode: "6.20",
              babyMovementCode: "6.30",
              babyBreathingCode: "6.40",
              eyeCode: "6.50"),
        ),
        transition: Transition.fadeIn,
      );
    } else {
      Get.offAll(
        () => AnnotationSuccessfulScreen(
          codesModel: OutputCodesModel(
              cameraId: cameraId,
              babyId: babyId,
              nurseId: nurseId,
              babyIncubatorStateId: babyIncubatorStateId,
              whatsHappeningId: "5.0",
              behaviourCode: "6.10",
              babyVoiceCode: "6.20",
              babyMovementCode: "6.30",
              babyBreathingCode: "6.40",
              eyeCode: "6.50"),
        ),
        transition: Transition.fadeIn,
      );
    }
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
