import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:autoparts/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Клиенты',
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.list.length == 0
                      ? const Center(
                          child: Text('Список клиентов пуст'),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: controller.list.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(Routes.CLIENT_ORDERS,
                                  arguments: controller.list[i].id),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 4),
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                            Icons.person_outline_outlined),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Text(
                                                  'Организация: ${controller.list[i].organization}',
                                                  style:
                                                      Get.textTheme.bodyText2,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Адрес: ${controller.list[i].address}',
                                              style: Get.textTheme.caption,
                                            ),
                                            Text(
                                              'Телефон: ${controller.list[i].phone}',
                                              style: Get.textTheme.caption,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
            ),
          )
        ],
      ),
    );
  }
}
