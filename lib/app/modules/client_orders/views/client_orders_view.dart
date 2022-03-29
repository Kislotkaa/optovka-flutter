import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:optovka/app/routes/app_pages.dart';

import '../controllers/client_orders_controller.dart';

class ClientOrdersView extends GetView<ClientOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказы', style: Get.textTheme.headline2),
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
                          child: Text('Список заказов пуст'),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: controller.list.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(Routes.ORDER_DETAIL,
                                  arguments: controller.list[i]?.id),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 4),
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Контактное лицо: ${(controller.client.value?.fio ?? '').toString()}',
                                          style: Get.textTheme.caption,
                                        ),
                                        Text(
                                          '${(controller.list[i]?.createAt ?? '').toString()}',
                                          style: Get.textTheme.caption,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Заказ №${i + 1} на номер ${controller.client.value?.phone ?? ''}',
                                              style: Get.textTheme.bodyText2,
                                            ),
                                            SizedBox(width: 8),
                                          ],
                                        ),
                                        Text(
                                          '${(controller.list[i]?.totalPrice ?? 0).toString()} руб',
                                          style: Get.textTheme.bodyText2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
