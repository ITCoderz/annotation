import 'package:get/get.dart';

import '../screens/annotation_landing/controller/annotation_landing_controller.dart';
import '../screens/baby_incubator_state/controller/baby_incubator_controller.dart';
import '../screens/baby_next_condition/controller/baby_next_condition_controller.dart';
import '../screens/selection/controller/selection_controller.dart';
import '../screens/splash_screen/controller/splash_controller.dart';
import '../screens/successful_annotation/controller/successful_annotation_controller.dart';
import '../screens/whats_happening/controller/whats_happening_controller.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SuccessfulAnnotationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AnnotationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SelectionController(),
      fenix: true,
    );
    Get.lazyPut(
      () => BabyIncubatorStateController(),
      fenix: true,
    );

    Get.lazyPut(
      () => BabyNextConditionController(),
      fenix: true,
    );
    Get.lazyPut(
      () => WhatsHappeningController(),
      fenix: true,
    );
  }
}
