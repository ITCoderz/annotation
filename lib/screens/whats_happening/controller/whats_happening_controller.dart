import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';
import '../../baby_next_condition/view/baby_next_condition_screen.dart';

class WhatsHappeningController extends GetxController {
  final isNightTime = false.obs;
  String cameraId = "";
  String babyId = "";
  String nurseId = "";
  String babyIncubatorStateId = "";
  String whatsHappeningId = "";

  @override
  void onInit() {
    getThemeValue();

    super.onInit();
  }

  setWhatsHappeningStateId({
    required String babyIncubatorStateId,
    required String cameraId,
    required String babyId,
    required String nurseId,
    required String whatsHappeningId,
  }) {
    this.babyIncubatorStateId = babyIncubatorStateId;
    this.cameraId = cameraId;
    this.babyId = babyId;
    this.nurseId = nurseId;
    this.whatsHappeningId = whatsHappeningId;
    validateNavigation();
  }

  validateNavigation() {
    Get.to(
      () => BabyNextConditionScreen(
        cameraId: cameraId,
        babyId: babyId,
        nurseId: nurseId,
        babyIncubatorStateId: babyIncubatorStateId,
        whatsHappeningId: whatsHappeningId,
      ),
      transition: Transition.fadeIn,
    );
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
