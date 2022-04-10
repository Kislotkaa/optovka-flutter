import 'package:dartx/dartx.dart';
import 'package:facult/app/controllers/sqllite_controller.dart';
import 'package:facult/app/utils/extends.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFacultController extends GetxController {
  NewFacultController({required this.sqlLiteController});

  final SqlLiteController sqlLiteController;

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController lecti = TextEditingController();
  TextEditingController practic = TextEditingController();
  TextEditingController lab = TextEditingController();

  bool valid() {
    if (name.text == '') return false;
    if (description.text == '') return false;
    if (lecti.text == '') return false;
    if (practic.text == '') return false;
    if (lab.text == '') return false;

    return true;
  }

  Future<void> addNewFacult() async {
    if (valid()) {
      try {
        await sqlLiteController.addFacult(
          name.text,
          description.text,
          lecti.text,
          practic.text,
          lab.text,
        );
      } catch (e) {
        print(e);
        showSnackbar('Произошла внутренняя ошибка', 'Ошибка');
      }
    } else {
      showSnackbar('Не все поля заполенны', 'Ошибка валидации');
    }
  }
}
