import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper3 {
  static final DatabaseHelper3 instance = DatabaseHelper3._internal();
  static Database? _database;

  DatabaseHelper3._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            subtitle TEXT
          )
        ''');
      },
    );
  }

  // INSERT
  Future<void> insertItem(String title, String subtitle) async {
    final db = await database;
    await db.insert('notes', {
      'title': title,
      'subtitle': subtitle,
    });
  }

  // READ
  Future<List<Map<String, dynamic>>> getnotes() async {
    final db = await database;
    return await db.query('notes');
  }
}
