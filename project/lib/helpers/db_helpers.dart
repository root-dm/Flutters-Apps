import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future _onConfigure(sql.Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'assigmentdatanew6.db'),
      version: 1,
      onCreate: _createDB,
      onConfigure: _onConfigure,
    );
  }

  static Future insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    var insert = await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    print (insert);
  }

  static Future<List<Map<String, dynamic>>> testLogin(
      String table, String username, String password) async {
    final db = await DBHelper.database();
    return db.rawQuery("SELECT * FROM users WHERE username='" +
        username +
        "' and password='" +
        password +
        "'");
  }

  static Future<List<Map<String, dynamic>>> getData(
      String table) async {
    final db = await DBHelper.database();
    return db.rawQuery("SELECT * FROM "+table);
  }

  static Future<void> updater(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    var update =
        await db.update(table, data, where: "id = ?", whereArgs: [data['id']]);
  }

  static Future _createDB(db, version) {
    print("creating db");
    db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL, 
          surname TEXT NOT NULL, 
          birthdate TEXT NOT NULL, 
          gender TEXT NOT NULL, 
          weight TEXT NOT NULL, 
          username TEXT NOT NULL, 
          password TEXT NOT NULL, 
          email TEXT NOT NULL)''');

    return db.execute(
      '''
      CREATE TABLE events (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        event TEXT NOT NULL,
        date TEXT NOT NULL,
        intersity TEXT NOT NULL,
        user_id INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id))
    ''');
  }
}
