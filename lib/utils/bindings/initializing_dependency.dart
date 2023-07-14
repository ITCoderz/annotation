import 'package:get/get.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(
    //   () => ImportWalletController(),
    //   fenix: true,
    // );
  }
}
