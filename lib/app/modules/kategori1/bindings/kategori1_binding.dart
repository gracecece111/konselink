import 'package:get/get.dart';

import '../controllers/kategori1_controller.dart';

class Kategori1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Kategori1Controller>(
      () => Kategori1Controller(),
    );
  }
}
