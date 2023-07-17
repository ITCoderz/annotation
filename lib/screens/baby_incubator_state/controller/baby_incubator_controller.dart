import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';
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

  setBabyIncubatorStateId({
    required String babyIncubatorStateId,
    required String cameraId,
    required String babyId,
    required String nurseId,
  }) {
    this.babyIncubatorStateId = babyIncubatorStateId;
    this.cameraId = cameraId;
    this.babyId = babyId;
    this.nurseId = nurseId;
    validateNavigation();
  }

  validateNavigation() {
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

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
