import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autoparts/app/controllers/sqllite_controller.dart';
import 'package:autoparts/app/model/client.dart';
import 'package:autoparts/app/model/product.dart';
import 'package:autoparts/app/model/product_order.dart';
import 'package:autoparts/app/routes/app_pages.dart';
import 'package:autoparts/app/utils/extends.dart';

class CheckoutOrderController extends GetxController {
  CheckoutOrderController({required this.sqlLiteController});

  final SqlLiteController sqlLiteController;
  static CheckoutOrderController get to => Get.find();
  RxList<ProductOrder> baskets = RxList();
  RxBool isLoading = RxBool(false);

  bool get isEmptyBasket => baskets.isEmpty;
  double get getPrice => _getPrice();

  final TextEditingController company = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();

  void removeFromBasket(dynamic item) {
    if (item != null) baskets.remove(item);
  }

  double _getPrice() {
    double result = 0;
    for (var element in baskets) {
      result += element.product.price.toDouble() * element.quantity.toDouble();
      result += 0;
    }
    return result;
  }

  void clearBasket() {
    baskets.clear();
  }

  void clearTextField() {
    company.clear();
    address.clear();
    phone.clear();
  }

  void addToBasket(dynamic item) {
    if (item is Product) {
      final ProductOrder? basketItem =
          baskets.firstOrNullWhere((element) => element.product.id == item.id);
      if (basketItem == null) {
        baskets.add(ProductOrder(item, 1));
      } else {
        basketItem.quantity = basketItem.quantity + 1;
        baskets.refresh();
      }
    } else if (item is ProductOrder) {
      item.quantity = item.quantity + 1;
      baskets.refresh();
    }
  }

  void minusProductFrombasket(dynamic item) {
    if (item is Product) {
      final basketItem =
          baskets.firstOrNullWhere((e) => e.product.id == (item.id));
      if (basketItem == null) return;
      basketItem.quantity = basketItem.quantity - 1;
      if (basketItem.quantity == 0) baskets.remove(basketItem);
      baskets.refresh();
    } else if (item is ProductOrder) {
      item.quantity = item.quantity - 1;
      if (item.quantity == 0) {
        baskets.value.remove(item);
      }
      baskets.refresh();
    }
    if (baskets.length == 0) Get.back();
  }

  bool validator() {
    if (baskets.length == 0) {
      showSnackbar('Добавтьте товары в корзину', 'Корзина пуста');
      return false;
    }
    if (company.text == '') {
      showSnackbar('Введите название компании', 'Название компании не найдено');
      return false;
    }
    if (address.text == '') {
      showSnackbar('Введите адрес доставки ', 'Адрес не найдено');
      return false;
    }
    if (phone.text == '') {
      showSnackbar('Введите контакнтый телефон', 'Телефон не найдено');
      return false;
    }
    return true;
  }

  Future<void> createOrder() async {
    if (validator() == true) {
      print('create order');
      try {
        isLoading.value = true;
        await sqlLiteController.createOrder(
          baskets.value,
          Client(
            '',
            company.text,
            address.text,
            phone.text,
          ),
        );
        clearTextField();
        clearBasket();
        Get.offAndToNamed(Routes.PROFILE);
        showSnackbar('Заказ оформлен', 'Ура!');
      } catch (e) {
        showSnackbar('Произошла внутренняя ошибка', 'Ошибка');
      } finally {
        isLoading.value = false;
      }
    }
  }
}
