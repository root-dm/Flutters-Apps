import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'ask3db.db'),
      version: 1,
      onCreate: _createDB,
    );
  }

  static Future insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.ignore);
  }

  static Future<void> updatefun(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.update(table, data, where: "id = " + data['id'].toString());
  }

  static Future<List<Map<String, dynamic>>> loginfunc(String user, String pass) async {
    final db = await DBHelper.database();
    return db.rawQuery("SELECT * FROM ask3db WHERE username='" +
        user +
        "' and password='" +
        pass +
        "'");
  }

  static Future _createDB(db, version) {
    return db.execute('''
        CREATE TABLE ask3db (
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
