import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../model/product.dart';

Future<void> dbInit(Database db) async {
  final uuid = Uuid();
  await db.execute(
      '''CREATE TABLE user(id TEXT PRIMARY KEY, organization TEXT, address TEXT, phone TEXT,fio TEXT);''');
  await db.execute(
      '''CREATE TABLE product(id TEXT PRIMARY KEY,url TEXT,articul TEXT,name TEXT, description TEXT,countStr TEXT, price REAL);''');
  await db.execute(
      '''CREATE TABLE purchase(id TEXT PRIMARY KEY,clientId TEXT ,totalPrice NUMERIC, createAt TEXT, CONSTRAINT purchase_client_fk FOREIGN KEY (clientId) REFERENCES user (id));''');
  await db.execute(
      '''CREATE TABLE purchase_product(id TEXT PRIMARY KEY,productId TEXT,purchaseId TEXT ,quantity INT,CONSTRAINT product_fk FOREIGN KEY (productId) REFERENCES product (id),CONSTRAINT purchase_fk FOREIGN KEY (purchaseId) REFERENCES purchase (id));''');

  db.insert(
    'product',
    Product(uuid.v4(), 'assets/images/tomatoes.jpeg', 'Корпус машины', 'TSE23',
            'Синий УАЗ', 'шт', 42000.0)
        .toMap(),
  );
  db.insert(
    'product',
    Product(uuid.v4(), 'assets/images/potato.jpeg', 'Колёса', 'DVW-6',
            'Диаметр 90см, ширина 45см', 'шт', 8000.0)
        .toMap(),
  );
  db.insert(
    'product',
    Product(uuid.v4(), 'assets/images/сucumber.jpeg', 'Амортизаторы', 'AMT-92',
            'Гидравлические. Ход 20см', 'шт', 12000.0)
        .toMap(),
  );
  db.insert(
    'product',
    Product(uuid.v4(), 'assets/images/onion.jpeg', 'Подшибники', 'PDSH-2',
            'Диаметр 16мм, толщина 23мм', 'шт', 120.0)
        .toMap(),
  );
}
