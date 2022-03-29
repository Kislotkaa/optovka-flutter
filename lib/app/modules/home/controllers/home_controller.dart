import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/product.dart';
import 'package:optovka/app/modules/checkout_order/controllers/checkout_order_controller.dart';

class HomeController extends GetxController {
  HomeController({
    required this.sqlController,
    required this.checkoutOrderController,
  });

  final SqlLiteController sqlController;
  final CheckoutOrderController checkoutOrderController;

  RxList<Product?> list = RxList<Product?>();

  RxBool isLoading = RxBool(false);

  @override
  Future<void> onInit() async {
    try {
      isLoading.value = true;
      list.value = await sqlController.getProducts();
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

  bool checkBasket(String id) {
    bool result = false;
    checkoutOrderController.baskets.forEach((element) {
      if (element.product.id == id) result = true;
    });

    return result;
  }

  void addBasket(Product? item) {
    if (checkBasket(item?.id ?? '')) {
      if (item != null) {
        print('remove');
        checkoutOrderController.minusProductFrombasket(item);
      }
    } else {
      if (item != null) {
        print('add');
        checkoutOrderController.addToBasket(item);
      }
    }
    list.refresh();
  }
}
