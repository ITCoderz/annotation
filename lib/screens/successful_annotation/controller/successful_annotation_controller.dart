import 'package:annotation/screens/annotaion_landing/view/annotation_landing_screen.dart';
import 'package:get/get.dart';

class SuccessfulAnnotationController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Get.offAll(
          () => const AnnotationLandingScreen(),
          transition: Transition.fadeIn,
        );
      },
    );
    super.onInit();
  }
}
