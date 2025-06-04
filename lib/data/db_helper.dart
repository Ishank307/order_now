import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // if i use DbHelper() and make a constructor of it in any other pages then
  // multiple databases can be created locally without any reasons therefore use singleton class using:-

  DbHelper._();

  static DbHelper getInstance() {
    // static used since object is created only once
    return DbHelper._();
  }

  Database? myDb;

  /// open Db
  Future<Database> getDb() async {
    if (myDb != null) {
      return myDb!;
    } else {
      myDb = await openDb();
      return myDb!;
    }
  }

  /// db Open (path -> if exists else create db)
  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = join(appDir.path, "noteDb");

    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        /// creation of all the tables
      },
      version: 1,
    );
  }
}
