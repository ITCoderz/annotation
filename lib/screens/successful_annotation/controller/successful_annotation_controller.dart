import 'package:annotation/models/app_code_models.dart';
import 'package:annotation/screens/selection/view/selection_screen.dart';
import 'package:get/get.dart';
import '../../../services/app_services/app_services.dart';

class SuccessfulAnnotationController extends GetxController {
  final isNightTime = false.obs;

  @override
  void onInit() {
    getThemeValue();
    super.onInit();
  }

  outputFunction({required OutputCodesModel outputCodesModel}) async {
    bool status;
    status = await AppServices.outputService(
      outputCodesModel: outputCodesModel,
    );
    if (status) {
      Future.delayed(
        const Duration(milliseconds: 3000),
        () {
          Get.offAll(
            () => const SelectionScreen(),
            transition: Transition.fadeIn,
          );
        },
      );
    } else {}
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
