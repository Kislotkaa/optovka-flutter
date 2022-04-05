import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:autoparts/app/model/client.dart';
import 'package:autoparts/app/model/product.dart';
import 'package:autoparts/app/model/purchase.dart';
import 'package:autoparts/app/modules/checkout_order/controllers/checkout_order_controller.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart';
import 'package:dartx/dartx.dart';

import '../model/product_order.dart';
import '../model/purchase_product.dart';
import 'db_init.dart';

class SqlLiteController extends GetxController {
  late Database _db;
  late Uuid _uuid;
  final int version = 13;

  Future open() async {
    _uuid = const Uuid();
    String path = join(await getDatabasesPath(), 'autoparts_db.db');
    // await deleteDatabase(path); // use if rebuild bd
    _db = await openDatabase(
      path,
      version: version,
      onCreate: (db, v1) async => await dbInit(db),
      onUpgrade: (db, v1, v2) async => await dbInit(db),
    );
  }

  @override
  Future<void> onInit() async {
    await open();
    var result = await getUsers();
    super.onInit();
  }

  Future<List<Product?>> getProducts() async {
    final result = await _db.query('product');
    final List<Product> returnData = [];
    result.forEach((element) {
      returnData.add(Product.fromMap(element));
    });
    return returnData;
  }

  Future<List<ProductOrder?>> getPurchaseProducts(String id) async {
    final result = await _db.query(
      'purchase_product',
      where: '"purchaseId" = ?',
      whereArgs: [id],
    );
    final List<String> idProducts = [];
    final List<int> quantityProducts = [];

    result.forEach((element) {
      idProducts.add(element['productId'].toString());
      quantityProducts.add((element['quantity'].toString()).toInt());
    });

    final List<ProductOrder> returnData = [];
    for (var i = 0; i < idProducts.length; i++) {
      var product = await getProductByPk(idProducts[i]);
      returnData.add(ProductOrder(product!, quantityProducts[i]));
    }

    return returnData;
  }

  Future<List<Client>> getUsers() async {
    final result = await _db.query('user');
    final List<Client> returnData = [];
    result.forEach((element) {
      returnData.add(Client.fromMap(element));
    });
    return returnData;
  }

  Future<Client?> getUserByPk(String id) async {
    final result = await _db.query('user', where: '"id" = ?', whereArgs: [id]);
    final List<Client> returnData = [];
    result.forEach((element) {
      returnData.add(Client.fromMap(element));
    });
    return returnData.firstOrNull;
  }

  Future<Product?> getProductByPk(String id) async {
    final result =
        await _db.query('product', where: '"id" = ?', whereArgs: [id]);
    final List<Product> returnData = [];
    result.forEach((element) {
      returnData.add(Product.fromMap(element));
    });
    return returnData.firstOrNull;
  }

  Future<List<Purchase?>> getOrderClient(String id) async {
    final result =
        await _db.query('purchase', where: '"clientId" = ?', whereArgs: [id]);
    final List<Purchase> returnData = [];
    result.forEach((element) {
      returnData.add(Purchase.fromMap(element));
    });
    print(returnData);
    return returnData;
  }

  Future<void> createOrder(
      List<ProductOrder> listProduct, Client client) async {
    var clientId = _uuid.v4();
    var purchaseId = _uuid.v4();
    var sum = 0.0;
    listProduct.forEach((element) {
      sum += element.product.price * element.quantity;
    });
    var clients = await getUsers();
    clients.forEach((element) {
      if (element.organization == client.organization) client = element;
    });
    if (client.id == '') {
      client.id = clientId;
      await _db.insert(
        'user',
        client.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await _db.insert(
      'purchase',
      Purchase(
        purchaseId,
        client.id,
        sum,
        getDefaultTimeFormat(DateTime.now()),
      ).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    listProduct.forEach((element) async {
      await _db.insert(
        'purchase_product',
        PurchaseProduct(
                _uuid.v4(), element.product.id, purchaseId, element.quantity)
            .toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    print(purchaseId);
  }

  static String getDefaultTimeFormat(DateTime dateTime) {
    return DateFormat('dd MMMM HH:mm', 'ru').format(dateTime);
  }
}
