import 'package:get/get.dart';
import 'package:autoparts/app/controllers/sqllite_controller.dart';
import 'package:autoparts/app/model/product_order.dart';

class OrderDetailController extends GetxController {
  OrderDetailController({required this.sqlLiteController});
  final SqlLiteController sqlLiteController;

  final RxList<ProductOrder?> list = RxList();
  RxBool isLoading = RxBool(false);

  Future<void> getProductsOrder(String id) async {
    list.value = await sqlLiteController.getPurchaseProducts(id);
    print(list.value);
  }

  @override
  Future<void> onInit() async {
    var id = Get.arguments;
    await getProductsOrder(id);
    super.onInit();
  }
}
