import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';

import '../../../model/client.dart';

class AddStudentFacultController extends GetxController {
  AddStudentFacultController({required this.sqlLiteController});

  final SqlLiteController sqlLiteController;
  final RxList<Client> list = RxList();

  final count = 0.obs;

  @override
  Future<void> onInit() async {
    list.value = await sqlLiteController.getUsers();
    super.onInit();
  }

  void addStudent(Client student) {
    Get.back(result: student);
  }
}
