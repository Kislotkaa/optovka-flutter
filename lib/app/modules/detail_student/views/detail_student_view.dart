import 'package:facult/app/widgets/base_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/detail_student_controller.dart';

class DetailStudentView extends GetView<DetailStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseTitle('Студент'),
        centerTitle: true,
      ),
      body: Stack(children: [
        ListView(
          children: [
            SizedBox(height: 12),
            Text(
              'Информация о студенте',
              style: Get.textTheme.headline1,
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.firstName,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Zdasа-яА-Я]')),
              ],
              decoration: InputDecoration(
                labelText: 'Фамилия',
              ),
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Zdasа-яА-Я]')),
              ],
              decoration: InputDecoration(
                labelText: 'Имя',
              ),
            ),
            SizedBox(height: 6),
            TextFormField(
              controller: controller.lastName,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Zdasа-яА-Я]')),
              ],
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: InputDecoration(
                labelText: 'Телефон',
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async => await controller.updateStudent(),
                child: Text(
                  'Обновить',
                  style: Get.textTheme.bodyText2,
                ),
              ),
            ),
          ),
        )
      ]).paddingAll(16),
    );
  }
}
