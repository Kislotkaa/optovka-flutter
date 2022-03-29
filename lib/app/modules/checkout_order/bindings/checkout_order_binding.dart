import 'package:get/get.dart';

import '../controllers/checkout_order_controller.dart';

class CheckoutOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutOrderController>(
      () => CheckoutOrderController(sqlLiteController: Get.find()),
    );
  }
}
