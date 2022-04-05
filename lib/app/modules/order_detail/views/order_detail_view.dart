import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ', style: Get.textTheme.headline2),
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
                          child: Text('Список продуктов пуст'),
                        )
                      : GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8, top: 16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 6,
                            crossAxisCount: 2,
                            mainAxisExtent: 260,
                          ),
                          itemCount: controller.list.length,
                          itemBuilder: ((context, i) {
                            return ProductItem(
                              quintity: controller.list[i]?.quantity,
                              isDetail: true,
                              item: controller.list[i]?.product,
                            );
                          }),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
