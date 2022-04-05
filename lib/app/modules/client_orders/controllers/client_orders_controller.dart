import 'package:get/get.dart';
import 'package:autoparts/app/controllers/sqllite_controller.dart';
import 'package:autoparts/app/model/client.dart';
import 'package:autoparts/app/model/purchase.dart';

class ClientOrdersController extends GetxController {
  ClientOrdersController({required this.sqlLiteController});
  final SqlLiteController sqlLiteController;
  Rxn<Client> client = Rxn<Client>(null);
  RxList<Purchase?> list = RxList<Purchase>();
  RxBool isLoading = RxBool(false);

  @override
  Future<void> onInit() async {
    String id = Get.arguments;
    await getOrders(id);

    super.onInit();
  }

  Future<void> getOrders(String id) async {
    try {
      isLoading.value = true;
      list.value = await sqlLiteController.getOrderClient(id);
      client.value = await sqlLiteController.getUserByPk(id);
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
