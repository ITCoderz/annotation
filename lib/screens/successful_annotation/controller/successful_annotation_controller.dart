import 'package:get/get.dart';
import '../../../services/app_services/app_services.dart';
import '../../annotation_landing/view/annotation_landing_screen.dart';

class SuccessfulAnnotationController extends GetxController {
  final isNightTime = false.obs;

  @override
  void onInit() {
    getThemeValue();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        // Get.offAll(
        //   () => const AnnotationLandingScreen(),
        //   transition: Transition.fadeIn,
        // );
      },
    );
    super.onInit();
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
