import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';

Future<void> initAppModule() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initializeDateFormatting();
  await _initApi();
  await _initController();
}

Future<void> _initController() async {
  // Get.put(CheckoutOrderController(sqlLiteController: Get.find()));
}

Future<void> _initApi() async {
  await Get.put(SqlLiteController()).onInit();
}
