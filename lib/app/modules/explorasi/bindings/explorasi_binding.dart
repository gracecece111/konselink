import 'package:get/get.dart';

import '../controllers/explorasi_controller.dart';

class ExplorasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExplorasiController>(
      () => ExplorasiController(),
    );
  }
}
