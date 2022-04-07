import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:facult/app/widgets/base_title.dart';

import '../controllers/add_student_facult_controller.dart';

class AddStudentFacultView extends GetView<AddStudentFacultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseTitle('Выберите студента'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.list.length == 0
            ? const Center(
                child: Text('Список студентов пуст, добавьте нового студента'),
              )
            : ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: controller.list.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => controller.addStudent(controller.list[i]),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.black45,
                            size: 30,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ФИО: ${controller.list[i].firstName} ${controller.list[i].name} ${controller.list[i].lastName}',
                                style: Get.textTheme.bodyText2,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Телефон: ${controller.list[i].phone}',
                                style: Get.textTheme.caption,
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Адрес: ${controller.list[i].address}',
                                style: Get.textTheme.caption,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
