import 'package:get/get.dart';

import '../controllers/gurubk_controller.dart';

class GurubkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GurubkController>(
      () => GurubkController(),
    );
  }
}
