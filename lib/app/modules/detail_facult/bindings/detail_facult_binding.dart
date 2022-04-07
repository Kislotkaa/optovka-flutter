import 'package:get/get.dart';

import '../controllers/detail_facult_controller.dart';

class DetailFacultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailFacultController>(
      () => DetailFacultController(sqlLiteController: Get.find()),
    );
  }
}
