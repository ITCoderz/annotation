import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';
import '../../baby_incubator_state/view/baby_incubator_state_screen.dart';

class SelectionController extends GetxController {
  final isNightTime = false.obs;
  String cameraId = "";
  String babyId = "";
  String nurseId = "";

  @override
  void onInit() {
    getThemeValue();

    super.onInit();
  }

  assignCameraId({required String id}) {
    cameraId = id;
  }

  assignBabyId({required String id}) {
    babyId = id;
  }

  assignNurseId({required String id}) {
    nurseId = id;
  }

  navigateValidator() {
    if (cameraId == "" || babyId == "" || nurseId == "") {
    } else {
      Get.to(
        () => BabyIncubatorStateScreen(
          cameraId: cameraId,
          babyId: babyId,
          nurseId: nurseId,
        ),
        transition: Transition.fadeIn,
      );
    }
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
