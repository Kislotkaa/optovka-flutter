import 'package:get/get.dart';

import '../modules/checkout_order/bindings/checkout_order_binding.dart';
import '../modules/checkout_order/views/checkout_order_view.dart';
import '../modules/client_orders/bindings/client_orders_binding.dart';
import '../modules/client_orders/views/client_orders_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_ORDER,
      page: () => CheckoutOrderView(),
      binding: CheckoutOrderBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_ORDERS,
      page: () => ClientOrdersView(),
      binding: ClientOrdersBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
  ];
}
