import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:optovka/app/model/product.dart';
import 'package:optovka/app/modules/checkout_order/controllers/checkout_order_controller.dart';
import 'package:optovka/app/resources/app_colors.dart';
import 'package:optovka/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Каталог',
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () => Get.toNamed(Routes.PROFILE),
              child: const Icon(Icons.person_outline).paddingOnly(
                right: 16,
              )),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(16),
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
                      () =>
                          controller.checkoutOrderController.baskets.length != 0
                              ? SizedBox(
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
                                ).paddingSymmetric(horizontal: 16, vertical: 16)
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
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 75,
                  width: 120,
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
                  Text('${item?.price.toString()} рублей'),
                  SizedBox(height: 4),
                  quintity != null
                      ? Text(quintity.toString() + (item?.countStr ?? ''))
                      : SizedBox(),
                ],
              )
            ],
          ),
          Row(
            children: [
              quintity != null && isDetail == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  CheckoutOrderController.to.addToBasket(item),
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: Get.width * 0.1),
                            GestureDetector(
                              onTap: () => CheckoutOrderController.to
                                  .minusProductFrombasket(item),
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              isBasket
                  ? Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primaryConst, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        child: const Icon(Icons.check).paddingAll(4),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
