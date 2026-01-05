import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper2 {
  static final DatabaseHelper2 instance = DatabaseHelper2._internal();
  static Database? _database;

  DatabaseHelper2._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'itemss.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE itemss (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            title TEXT,
            subtitle TEXT
          )
        ''');
      },
    );
  }

  // INSERT
  Future<void> insertItem(String image, String title, String subtitle) async {
    final db = await database;
    await db.insert('itemss', {
      'image': image,
      'title': title,
      'subtitle': subtitle,
    });
  }

  // READ
  Future<List<Map<String, dynamic>>> getItemss() async {
    final db = await database;
    return await db.query('itemss');
  }
}
