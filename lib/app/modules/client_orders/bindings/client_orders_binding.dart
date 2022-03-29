import 'package:get/get.dart';

import '../controllers/client_orders_controller.dart';

class ClientOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientOrdersController>(
      () => ClientOrdersController(sqlLiteController: Get.find()),
    );
  }
}
