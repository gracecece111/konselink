import 'package:get/get.dart';

import '../controllers/konseling_controller.dart';

class KonselingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonselingController>(
      () => KonselingController(),
    );
  }
}
