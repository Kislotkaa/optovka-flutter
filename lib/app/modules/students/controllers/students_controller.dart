import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/client.dart';
import 'package:optovka/app/routes/app_pages.dart';

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
}
