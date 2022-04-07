import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/client.dart';
import 'package:optovka/app/routes/app_pages.dart';
import 'package:optovka/app/utils/extends.dart';
import 'package:uuid/uuid.dart';

class NewStudentController extends GetxController {
  NewStudentController({required this.sqlLiteController});

  final SqlLiteController sqlLiteController;

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

  Future<void> addNewStudent() async {
    var uuid = const Uuid();
    if (valid()) {
      try {
        var client = Client(uuid.v4(), address.text, phone.text, name.text,
            lastName.text, firstName.text);
        var result = await sqlLiteController.createUser(client);
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
}
