import 'package:facult/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:facult/app/controllers/sqllite_controller.dart';
import 'package:facult/app/model/facult.dart';

import '../../../utils/extends.dart';

class HomeController extends GetxController {
  HomeController({
    required this.sqlController,
  });

  final SqlLiteController sqlController;

  RxList<Facult?> list = RxList<Facult?>();

  RxBool isLoading = RxBool(false);

  @override
  Future<void> onInit() async {
    await getFaluct();
    super.onInit();
  }

  Future<void> getFaluct() async {
    try {
      isLoading.value = true;
      list.value = await sqlController.getProducts();
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> newFacult() async {
    await Get.toNamed(Routes.NEW_FACULT)?.then((value) async {
      await getFaluct();
    });
  }

  Future<void> delFacult(String id) async {
    await showDefaultDialog(
      cancelAction: () {
        Get.back();
      },
      cancelText: 'Отмена',
      confirmAction: () {
        Get.back();
        sqlController.delfacult(id);
      },
      confirmText: 'Уверен',
      middleText: 'Вы уверены что хотите удалить факультет?',
      title: 'Удаление факультета',
    ).then((value) async {
      await getFaluct();
    });
  }
}
