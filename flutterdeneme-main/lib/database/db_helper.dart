import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "Contact.db");
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Contact(id INTEGER PRIMARY KEY, name TEXT, phone_number TEXT, avatar TEXT)");
  }
}
