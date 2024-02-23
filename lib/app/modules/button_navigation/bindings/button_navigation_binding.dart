import 'package:get/get.dart';

import '../controllers/button_navigation_controller.dart';

class ButtonNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonNavigationController>(
      () => ButtonNavigationController(),
    );
  }
}
