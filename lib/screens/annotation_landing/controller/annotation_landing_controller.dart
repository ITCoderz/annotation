import 'package:get/get.dart';

import '../../../services/app_services/app_services.dart';

class AnnotationController extends GetxController {
  final isNightTime = false.obs;

  @override
  void onInit() {
    super.onInit();
    getThemeValue();
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
