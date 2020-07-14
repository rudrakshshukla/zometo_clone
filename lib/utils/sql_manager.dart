import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zometo_clone/ui/restorentsList/model/sqlmodel/Sql_Restorent_model.dart';


class SqlManager{
  SqlManager._();
  static final SqlManager db = SqlManager._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Restorent ("
          "id INTEGER PRIMARY KEY,"
          "restorent_name TEXT,"
          "restorent_thumbnail TEXT,"
          "restorent_timings TEXT,"
          "restorent_address TEXT,"
          "restorent_rating REAL,"
          "restorent_phone TEXT,"
          "restorent_photosUrl TEXT"
          ")");
    });
  }

  insertNewRestro(SqlRestorentModel restorentModel)
  async {
    final db = await database;
    var res = await db.insert("Restorent", restorentModel.toMap());
    return res;
  }


  getRestorent(String startFrom,String till) async {
    final db = await database;
    if(startFrom=="0")
      {
        var res =await  db.rawQuery(" SELECT * FROM Restorent LIMIT 10");
        List<SqlRestorentModel> list =
        res.isNotEmpty ? res.map((c) => SqlRestorentModel.fromMap(c)).toList() : [];
        return list;

      }
    else{

      var res =await  db.rawQuery("SELECT * FROM Restorent LIMIT  10 OFFSET "+ startFrom);
      List<SqlRestorentModel> list =
      res.isNotEmpty ? res.map((c) => SqlRestorentModel.fromMap(c)).toList() : [];
      return list;


    }

  }
}