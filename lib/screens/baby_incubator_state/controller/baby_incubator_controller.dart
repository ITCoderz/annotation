import 'package:get/get.dart';

import '../../../models/app_code_models.dart';
import '../../../services/app_services/app_services.dart';
import '../../successful_annotation/view/annotation_successful_screen.dart';
import '../../whats_happening/view/whats_happening_screen.dart';

class BabyIncubatorStateController extends GetxController {
  final isNightTime = false.obs;
  String cameraId = "";
  String babyId = "";
  String nurseId = "";
  String babyIncubatorStateId = "";

  @override
  void onInit() {
    getThemeValue();

    super.onInit();
  }

  setBabyInsideIncubatorStateId({
    required String babyIncubatorStateId,
    required String cameraId,
    required String babyId,
    required String nurseId,
  }) {
    this.babyIncubatorStateId = babyIncubatorStateId;
    this.cameraId = cameraId;
    this.babyId = babyId;
    this.nurseId = nurseId;
    validateInsideIncubatorNavigation();
  }

  validateInsideIncubatorNavigation() {
    Get.to(
      () => WhatsHappeningScreen(
        cameraId: cameraId,
        babyId: babyId,
        nurseId: nurseId,
        babyIncubatorStateId: babyIncubatorStateId,
      ),
      transition: Transition.fadeIn,
    );
  }

  setBabyNotInsideIncubatorState({
    required String babyIncubatorStateId,
    required String cameraId,
    required String babyId,
    required String nurseId,
  }) {
    this.babyIncubatorStateId = babyIncubatorStateId;
    this.cameraId = cameraId;
    this.babyId = babyId;
    this.nurseId = nurseId;
    validateOutsideIncubatorNavigation();
  }

  validateOutsideIncubatorNavigation() {
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

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
