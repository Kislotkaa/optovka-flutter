import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../model/facult.dart';

Future<void> dbInit(Database db) async {
  final uuid = Uuid();
  await db.execute(
      '''CREATE TABLE user(id TEXT PRIMARY KEY, address TEXT, phone TEXT,name TEXT,lastName TEXT, firstName TEXT);''');
  await db.execute(
      '''CREATE TABLE facult(id TEXT PRIMARY KEY,name TEXT, description TEXT,lekci TEXT, practic TEXT,laboratory TEXT);''');
  await db.execute(
      '''CREATE TABLE user_facult(id TEXT PRIMARY KEY,userId TEXT, facultId TEXT ,grade INT,CONSTRAINT user_fk FOREIGN KEY (userId) REFERENCES user (id),CONSTRAINT facult_fk FOREIGN KEY (facultId) REFERENCES facult (id));''');

  db.insert(
    'facult',
    Facult(uuid.v4(), 'Высшая математика', 'Высшая математика для 3-4 курсов',
            '6', '16', '10')
        .toMap(),
  );
  db.insert(
    'facult',
    Facult(uuid.v4(), 'Экономическая безопасность',
            'Экономическая безопасность для 1-2 курсов', '3', '12', '15')
        .toMap(),
  );
  db.insert(
    'facult',
    Facult(uuid.v4(), 'Иностранный язык', 'Иностранный язык для 1-3 курсов',
            '9', '22', '17')
        .toMap(),
  );
  db.insert(
    'facult',
    Facult(uuid.v4(), 'Схемотехника', 'Схемотехника для 1-4 курсов', '8', '19',
            '14')
        .toMap(),
  );
}
