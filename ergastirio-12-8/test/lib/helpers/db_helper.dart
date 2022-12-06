import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbpath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbpath, 'mydb.db'),
        version: 1, onCreate: _createDB);
  }

  static Future _createDB(db, version) {
    return db.execute('''
        CREATE TABLE notes(
          id INTEGER PRIMARY KEY AUTO INCREMENT,
          title TEXT NOT NULL, 
          text TEXT NOT NULL,
          extra TEXT)''');
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    print(data);
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.ignore);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
