import 'package:get/get.dart';

import '../controllers/new_facult_controller.dart';

class NewFacultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewFacultController>(
      () => NewFacultController(sqlLiteController: Get.find()),
    );
  }
}
