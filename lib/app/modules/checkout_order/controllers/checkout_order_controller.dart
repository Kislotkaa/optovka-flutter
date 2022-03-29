import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/client.dart';
import 'package:optovka/app/model/product.dart';
import 'package:optovka/app/model/product_order.dart';
import 'package:optovka/app/utils/extends.dart';

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
  final TextEditingController fio = TextEditingController();

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
    fio.clear();
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
      showSnackbar(
          'Введите названии компании', 'Название компании отсутствует');
      return false;
    }
    if (address.text == '') {
      showSnackbar('Введите адрес ', 'Адрес отсутствует');
      return false;
    }
    if (phone.text == '') {
      showSnackbar('Введите контакнтый телефон', 'Телефон отсутствует');
      return false;
    }
    if (fio.text == '') {
      showSnackbar('Введите ваше ФИО', 'ФИО отсутствует');
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
            fio.text,
          ),
        );
        clearTextField();
        clearBasket();
        Get.back();
        showSnackbar('Заказ успешно оформлен', 'Поздравляем!');
      } catch (e) {
        showSnackbar('Произошла какая то ошибка', 'Ошибка');
      } finally {
        isLoading.value = false;
      }
    }
  }
}
