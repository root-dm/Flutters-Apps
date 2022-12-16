import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  //function to insert to database

  static Future<sql.Database> database() async {
    //δημιουργια βασης αν δεν υπαρχει
    final dbPath = await sql
        .getDatabasesPath(); //to path αναλογα android/iOS επιστρεφει ενα future γιαυτο εχουμε βαλει το await.
    return sql.openDatabase(
      path.join(dbPath, 'assigment5.db'),
      version: 1,
      onCreate: _createDB,
    ); //αν υπαρχει το αρχειο ανοιγει την βαση διαφορετικα την δημιουργει
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    var insert = await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    //με το await εδω περιμενουμε να τελειωσουν ολες οι διαδικασιες στην συναρτηση insert
  }

  static Future<List<Map<String, dynamic>>> testLogin(
      String table, String username, String password) async {
    final db = await DBHelper.database();
    return db.rawQuery("SELECT * FROM users WHERE username='" +
        username +
        "' and password='" +
        password +
        "'"); //επιστρεφει μια λιστα απο maps
  }

  static Future<void> updater(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    var update =
        await db.update(table, data, where: "id = ?", whereArgs: [data['id']]);
    print(update);
  }

  static Future _createDB(db, version) {
    print("creating db");
    return db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL, 
          birthdate TEXT NOT NULL, 
          gender TEXT NOT NULL, 
          weight TEXT NOT NULL, 
          username TEXT NOT NULL, 
          password TEXT NOT NULL, 
          email TEXT NOT NULL)'''); //επιστρεφει ενα future και με το return ενημερωνει ποτε επιστρεφεται το future
  }
}
