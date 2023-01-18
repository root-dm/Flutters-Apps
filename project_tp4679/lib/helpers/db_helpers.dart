// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'demographics.db'),
      version: 1,
      onCreate: _createDB,
    );
  }

  static Future insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.ignore);
  }

  static Future<List<Map<String, dynamic>>> login(String u, String p) async {
    final db = await DBHelper.database();
    return db.rawQuery("SELECT * FROM demographics WHERE username='" +
        u +
        "' and password='" +
        p +
        "'");
  }

  static Future<void> updater(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.update(table, data, where: "id = " + data['id'].toString());
  }

  static Future _createDB(db, version) {
    return db.execute('''
        CREATE TABLE demographics (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL, 
          surname TEXT NOT NULL, 
          birthdate TEXT NOT NULL, 
          gender TEXT NOT NULL, 
          weight TEXT NOT NULL, 
          username TEXT NOT NULL, 
          password TEXT NOT NULL, 
          email TEXT NOT NULL)''');
  }
}
