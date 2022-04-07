import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/facult.dart';

class HomeController extends GetxController {
  HomeController({
    required this.sqlController,
  });

  final SqlLiteController sqlController;

  RxList<Facult?> list = RxList<Facult?>();

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
}
