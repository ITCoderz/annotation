import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';

class BabyNextConditionController extends GetxController {
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

  setBabyConditionValues() {}

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
