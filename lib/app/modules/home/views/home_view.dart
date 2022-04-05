import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:autoparts/app/model/product.dart';
import 'package:autoparts/app/modules/checkout_order/controllers/checkout_order_controller.dart';
import 'package:autoparts/app/resources/app_colors.dart';
import 'package:autoparts/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Товары',
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () => Get.toNamed(Routes.PROFILE),
              child: const Icon(Icons.settings).paddingOnly(
                right: 16,
              )),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GridView.builder(
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
                    itemBuilder: (context, i) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () => controller.addBasket(controller.list[i]),
                          child: ProductItem(
                            item: controller.list[i],
                            isBasket: controller
                                .checkBasket(controller.list[i]?.id ?? ''),
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => controller.checkoutOrderController.baskets.length !=
                              0
                          ? SafeArea(
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: Get.theme.elevatedButtonTheme.style,
                                  onPressed: () =>
                                      Get.toNamed(Routes.CHECKOUT_ORDER),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Перейти в корзину',
                                        style: Get.textTheme.bodyText2,
                                      ),
                                      Text(
                                        controller.checkoutOrderController
                                                .getPrice
                                                .toString() +
                                            ' руб',
                                        style: Get.textTheme.bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                              ).paddingSymmetric(horizontal: 16, vertical: 16),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.item,
    this.isBasket = false,
    this.quintity,
    this.isDetail = false,
  }) : super(key: key);

  final Product? item;
  final bool isBasket;
  final bool? isDetail;
  final int? quintity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: quintity != null && isDetail == false ? 100 : 150,
                  width: quintity != null && isDetail == false
                      ? 140
                      : double.infinity,
                  child: Image.asset(
                    item?.url ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item?.name ?? ''),
                  Text('Артикул: ${item?.articul.toString()}'),
                  Text('${item?.price.toString()} рублей'),
                  SizedBox(height: 4),
                ],
              ).paddingAll(6)
            ],
          ),
          isBasket
              ? Text(
                  'В корзине',
                  style: Get.textTheme.bodyText2!.copyWith(color: Colors.green),
                ).paddingOnly(bottom: 8)
              : const SizedBox(),
          quintity != null && isDetail == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => CheckoutOrderController.to.addToBasket(item),
                      child: Icon(Icons.add),
                    ),
                    SizedBox(width: 12),
                    Container(
                      child: quintity != null
                          ? Text(quintity.toString() + (item?.countStr ?? ''))
                          : SizedBox(),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => CheckoutOrderController.to
                          .minusProductFrombasket(item),
                      child: Icon(Icons.remove),
                    ),
                  ],
                ).paddingOnly(bottom: 12)
              : SizedBox(),
        ],
      ),
    );
  }
}
