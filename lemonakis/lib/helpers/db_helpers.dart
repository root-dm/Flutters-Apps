import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  //function to insert to database

  static Future<sql.Database> database() async {
    //δημιουργια βασης αν δεν υπαρχει
    final dbPath = await sql
        .getDatabasesPath(); //to path αναλογα android/iOS επιστρεφει ενα future γιαυτο εχουμε βαλει το await.
    return sql.openDatabase(
      path.join(dbPath, 'mydb.db'),
      version: 1,
      onCreate: _createDB,
    ); //αν υπαρχει το αρχειο ανοιγει την βαση διαφορετικα την δημιουργει
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    print(data); //τυπωνω τα δεδομένα για να δω οτι ειναι σωστά
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    //με το await εδω περιμενουμε να τελειωσουν ολες οι διαδικασιες στην συναρτηση insert
  }

  static Future _createDB(db, version) {
    return db.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT NOT NULL,
          surname TEXT NOT NULL,
          date TEXT NOT NULL,
          gender TEXT NOT NULL,
          weight TEXT NOT NULL,
          username TEXT NOT NULL,
          password TEXT NOT NULL,
          email TEXT NOT NULL)'''); //επιστρεφει ενα future και με το return ενημερωνει ποτε επιστρεφεται το future
  }

  static Future<List<Map<String, dynamic>>> getData(table) async {
    final db = await DBHelper.database();
    return db.query(table); //επιστρεφει μια λιστα απο maps
  }

  static Future<List<Map<String, dynamic>>> test(table) async {
    final db = await DBHelper.database();
    return db.rawQuery("Select * FROM users"); //επιστρεφει μια λιστα απο maps
  }
}
