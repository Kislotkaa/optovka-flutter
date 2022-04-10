import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../controllers/sqllite_controller.dart';
import '../../../model/client.dart';
import '../../../utils/extends.dart';

class DetailStudentController extends GetxController {
  DetailStudentController({required this.sqlLiteController});

  final SqlLiteController sqlLiteController;
  late Client student;

  TextEditingController name = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool valid() {
    if (name.text == '') return false;
    if (firstName.text == '') return false;
    if (lastName.text == '') return false;
    if (address.text == '') return false;
    if (phone.text == '') return false;
    return true;
  }

  Future<void> updateStudent() async {
    var uuid = Uuid();
    if (valid()) {
      try {
        var studentNew = Client(student.id, address.text, phone.text, name.text,
            firstName.text, lastName.text);
        await sqlLiteController.updateUser(studentNew);
        Get.back();
      } catch (e, s) {
        print(e);
        print(s);

        showSnackbar('Произошла внутренняя ошибка', 'Ошибка');
      }
    } else {
      showSnackbar('Не все поля заполнены', 'Ошибка валидации');
    }
  }

  Future<void> getUser(String id) async {
    if (id == null) Get.back();
    student = await sqlLiteController.getUserByPk(id) ??
        Client('', '', '', '', '', '');
    if (student.id == '') Get.back();
    name.text = student.name;
    firstName.text = student.firstName;
    lastName.text = student.lastName;
    address.text = student.address;
    phone.text = student.phone;
  }

  @override
  Future<void> onInit() async {
    String id = Get.arguments;
    await getUser(id);
    super.onInit();
  }
}
