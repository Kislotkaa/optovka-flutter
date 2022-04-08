import 'package:get/get.dart';
import 'package:facult/app/controllers/sqllite_controller.dart';
import 'package:facult/app/model/client.dart';
import 'package:facult/app/routes/app_pages.dart';

import '../../../utils/extends.dart';

class StudentsController extends GetxController {
  StudentsController({required this.sqlLiteController});

  final SqlLiteController sqlLiteController;
  final RxList<Client> list = RxList();

  @override
  Future<void> onInit() async {
    await updateStudent();
    super.onInit();
  }

  Future<void> updateStudent() async {
    await Future.delayed(Duration(milliseconds: 250));
    list.value = await sqlLiteController.getUsers();
  }

  Future<void> addNewStudent() async {
    await Get.toNamed(Routes.NEW_STUDENT)?.then((value) async {
      await updateStudent();
    });
  }

  Future<void> delUser(String id) async {
    await showDefaultDialog(
      cancelAction: () {
        Get.back();
      },
      cancelText: 'Отмена',
      confirmAction: () {
        Get.back();
        sqlLiteController.delUser(id);
      },
      confirmText: 'Уверен',
      middleText: 'Вы уверены что хотите удалить студента?',
      title: 'Удаление студента',
    ).then((value) => updateStudent());
  }
}
