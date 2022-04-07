import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:facult/app/model/client.dart';

import '../../../model/facult.dart';
import '../controllers/add_grade_student_controller.dart';

Future<void> showAddGradeDialog(Facult facult, Client student) async {
  await showCupertinoModalBottomSheet(
    context: Get.context!,
    builder: (context) => GetBuilder(
      init: AddGradeStudentController(
          sqlLiteController: Get.find(), facult: facult, student: student),
      builder: (dynamic _) => AddGradeStudentView(),
    ),
  );
}

class AddGradeStudentView extends GetView<AddGradeStudentController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Material(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                'Укажи оценку студента',
                style: Get.textTheme.headline1,
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.addGrade(1),
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.12,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text('1'),
                    ).paddingOnly(right: 8),
                  ),
                  GestureDetector(
                    onTap: () => controller.addGrade(2),
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.12,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text('2'),
                    ).paddingOnly(right: 8),
                  ),
                  GestureDetector(
                    onTap: () => controller.addGrade(3),
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.12,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text('3'),
                    ).paddingOnly(right: 8),
                  ),
                  GestureDetector(
                    onTap: () => controller.addGrade(4),
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.12,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text('4'),
                    ).paddingOnly(right: 8),
                  ),
                  GestureDetector(
                    onTap: () => controller.addGrade(5),
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.12,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text('5'),
                    ).paddingOnly(right: 8),
                  ),
                ],
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => controller.addGrade(0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Text(
                    'Убрать оценку',
                    style: Get.textTheme.bodyText2!
                        .copyWith(color: Colors.deepOrangeAccent[200]),
                  ),
                ).paddingOnly(right: 8),
              )
            ],
          ),
        ),
      ),
    );
  }
}
