import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;
  static final DBHelper instance = DBHelper._();

  DBHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  void _createTable(Database db, int version) async {
    String tableQuery =
        "CREATE TABLE todo ( id INTEGER PRIMARY KEY AUTOINCREMENT,taskName TEXT,taskCompleted INTEGER);";
    await db.execute(tableQuery);
    String calenderquery =
        "CREATE TABLE IF NOT EXISTS calender(calender_id INTEGER PRIMARY KEY AUTOINCREMENT,date TEXT NOT NULL,time TEXT NOT NULL,workinformation TEXT NOT NULL);";

    await db?.execute(calenderquery);
  }
}
