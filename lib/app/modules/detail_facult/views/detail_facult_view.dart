import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:optovka/app/resources/app_colors.dart';
import 'package:optovka/app/widgets/base_title.dart';

import '../controllers/detail_facult_controller.dart';

class DetailFacultView extends GetView<DetailFacultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => BaseTitle(controller.facult.value?.name ?? '')),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryConst,
        onPressed: () async => await controller.addStudentFacult(),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Obx(
        () => controller.list.length == 0
            ? const Center(
                child: Text('На факультет в данный момент ни кто не записан'),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: controller.list.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      controller.addGrade(controller.list[i].client);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'ФИО: ${controller.list[i].client.firstName} ${controller.list[i].client.name} ${controller.list[i].client.lastName}',
                                    style: Get.textTheme.bodyText2,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Телефон: ${controller.list[i].client.phone}',
                                    style: Get.textTheme.caption,
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Адрес: ${controller.list[i].client.address}',
                                    style: Get.textTheme.caption,
                                  )
                                ],
                              ),
                            ],
                          ),
                          controller.list[i].grade == 0
                              ? Text('Оценка не указана')
                              : Text(
                                  'Оценка: ${controller.list[i].grade}',
                                  style: Get.textTheme.bodyText2,
                                ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
      ),
    );
  }
}
