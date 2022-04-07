import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:optovka/app/widgets/base_title.dart';

import '../controllers/new_student_controller.dart';

class NewStudentView extends GetView<NewStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseTitle('Новый студент'),
        centerTitle: true,
      ),
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.all(8),
          children: [
            SizedBox(height: 12),
            Text(
              'Информация о студенте',
              style: Get.textTheme.headline1,
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.firstName,
              decoration: InputDecoration(
                labelText: 'Фамилия',
              ),
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(
                labelText: 'Имя',
              ),
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.lastName,
              decoration: InputDecoration(
                labelText: 'Отчество',
              ),
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.address,
              decoration: InputDecoration(
                labelText: 'Адресс',
              ),
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.phone,
              decoration: InputDecoration(
                labelText: 'Телефон',
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () => controller.addNewStudent(),
                child: Text(
                  'Добавить',
                  style: Get.textTheme.bodyText2,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
