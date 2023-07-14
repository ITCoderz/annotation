import 'package:get/get.dart';

import '../screens/successful_annotation/controller/successful_annotation_controller.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SuccessfulAnnotationController(),
      fenix: true,
    );
  }
}
