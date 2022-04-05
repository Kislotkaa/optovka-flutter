import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/checkout_order_controller.dart';

class CheckoutOrderView extends GetView<CheckoutOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Моя корзина',
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 220,
                child: Obx(
                  () => controller.baskets.length == 0
                      ? const Center(
                          child: Text('Корзина пуста'),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount: controller.baskets.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              child: ProductItem(
                                item: controller.baskets[i].product,
                                quintity: controller.baskets[i].quantity,
                              ),
                            );
                          },
                        ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text('Название компании', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.company,
                      decoration: const InputDecoration(hintText: '...'),
                    ),
                    const SizedBox(height: 8),
                    Text('Адрес доставки', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.address,
                      decoration: const InputDecoration(hintText: '...'),
                    ),
                    const SizedBox(height: 8),
                    Text('Контактный телефон', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.phone,
                      decoration: const InputDecoration(hintText: '...'),
                    ),
                    SizedBox(height: 150)
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => SafeArea(
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: Get.theme.elevatedButtonTheme.style,
                    onPressed: () => controller.createOrder(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Оформить заказ',
                          style: Get.textTheme.bodyText2,
                        ),
                        Text(
                          controller.getPrice.toString() + ' руб',
                          style: Get.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ).paddingSymmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
