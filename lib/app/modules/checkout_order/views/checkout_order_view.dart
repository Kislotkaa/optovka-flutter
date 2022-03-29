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
          'Корзина',
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Obx(
                () => Container(
                  height: controller.baskets.length == 1 ? 95 : 190,
                  child: Obx(
                    () => controller.baskets.length == 0
                        ? Center(
                            child: Text('Корзина пуста'),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
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
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text('Название', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.company,
                      decoration: const InputDecoration(
                          hintText: 'Введите название компании'),
                    ),
                    const SizedBox(height: 8),
                    Text('Адрес', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.address,
                      decoration:
                          const InputDecoration(hintText: 'Введите адрес'),
                    ),
                    const SizedBox(height: 8),
                    Text('Телефон', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.phone,
                      decoration: const InputDecoration(
                          hintText: 'Введите контактный телефон'),
                    ),
                    const SizedBox(height: 8),
                    Text('Контактное лицо', style: Get.textTheme.caption),
                    TextField(
                      controller: controller.fio,
                      decoration:
                          const InputDecoration(hintText: 'Введите ФИО'),
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
              () => SizedBox(
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
        ],
      ),
    );
  }
}
