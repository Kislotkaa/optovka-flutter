import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:facult/app/model/client.dart';
import 'package:facult/app/model/client_facult.dart';
import 'package:facult/app/model/facult.dart';
import 'package:facult/app/model/purchase.dart';
import 'package:facult/app/utils/extends.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart';
import 'package:dartx/dartx.dart';

import '../model/user_facult.dart';
import '../model/purchase_product.dart';
import 'db_init.dart';

class SqlLiteController extends GetxController {
  late Database _db;
  late Uuid _uuid;
  final int version = 13;

  Future open() async {
    _uuid = const Uuid();
    String path = join(await getDatabasesPath(), 'facult_db.db');
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

  Future<List<Facult?>> getProducts() async {
    final result = await _db.query('facult');
    final List<Facult> returnData = [];
    result.forEach((element) {
      returnData.add(Facult.fromMap(element));
    });
    return returnData;
  }

  Future<List<UserFacult?>> getPurchaseProducts(String id) async {
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

    final List<UserFacult> returnData = [];
    for (var i = 0; i < idProducts.length; i++) {
      var product = await getProductByPk(idProducts[i]);
      returnData.add(UserFacult(product!, quantityProducts[i]));
    }

    return returnData;
  }

  Future<bool> createUser(Client client) async {
    var clients = await getUsers();
    var isStudent = false;

    clients.forEach((element) {
      if (element.firstName == client.firstName) {
        isStudent = true;
      }
    });
    if (!isStudent) {
      await _db.insert(
        'user',
        client.toMap(),
      );
      return false;
    } else
      return true;
  }

  Future<void> addStudentFacult(Client student, Facult facult) async {
    var uuid = Uuid();
    var clients = await getUsersFacult(facult.id);
    var isStudent = false;
    clients.forEach((element) {
      if (element.client.firstName == student.firstName) {
        isStudent = true;
        return;
      }
    });
    if (!isStudent) {
      await _db.insert(
        'user_facult',
        {
          'id': uuid.v4(),
          'userId': student.id,
          'facultId': facult.id,
          'grade': 0,
        },
      );
    } else {
      showSnackbar('Такой студент уже есть на факультативе', 'Сообщаю!');
    }
  }

  Future<List<Client>> getUsers() async {
    final result = await _db.query('user');
    final List<Client> returnData = [];
    result.forEach((element) {
      returnData.add(Client.fromMap(element));
    });
    return returnData;
  }

  Future<void> addGradeStudent(
    int gradeCount,
    String facultId,
    String studentId,
  ) async {
    String id = await getUserThisFacult(studentId);

    _db.update(
      'user_facult',
      {
        'id': id,
        'userId': studentId,
        'facultId': facultId,
        'grade': gradeCount,
      },
      where: '"id" = ?',
      whereArgs: [id],
    );
  }

  Future<String> getUserThisFacult(String studentId) async {
    final result = await _db.query(
      'user_facult',
      where: '"userId" = ?',
      whereArgs: [studentId],
    );
    var returnData = '';
    result.forEach((element) {
      returnData = element['id'].toString();
      return;
    });
    return returnData;
  }

  Future<List<ClientFacult>> getUsersFacult(String id) async {
    final result = await _db.query(
      'user_facult',
      where: '"facultId" = ?',
      whereArgs: [id],
    );
    final List<String> idStudent = [];
    final List<String> gradeStudent = [];

    result.forEach((element) {
      idStudent.add(element['userId'].toString());
      gradeStudent.add(element['grade'].toString());
    });

    final List<ClientFacult> returnData = [];

    for (var i = 0; i < idStudent.length; i++) {
      var student = await getUserByPk(idStudent[i]);
      if (student != null) {
        returnData.add(
          ClientFacult(
            student,
            gradeStudent[i].toInt(),
          ),
        );
      }
    }

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

  Future<void> delUser(String id) async {
    await _db.delete('user', where: '"id" = ?', whereArgs: [id]);
  }

  Future<Facult?> getProductByPk(String id) async {
    final result =
        await _db.query('facult', where: '"id" = ?', whereArgs: [id]);
    final List<Facult> returnData = [];
    result.forEach((element) {
      returnData.add(Facult.fromMap(element));
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

  static String getDefaultTimeFormat(DateTime dateTime) {
    return DateFormat('dd MMMM HH:mm', 'ru').format(dateTime);
  }
}
