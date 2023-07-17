import 'package:annotation/models/app_code_models.dart';
import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';
import '../../baby_next_condition/view/baby_next_condition_screen.dart';

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

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
