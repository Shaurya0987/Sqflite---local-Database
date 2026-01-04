import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'contact.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');
  }

  // INSERT
  Future<void> insertContact(String name, String phone) async {
    final db = await database;
    await db.insert(
      'contacts',
      {
        'name': name,
        'phone': phone,
      },
    );
  }

  // READ ALL
  Future<List<Map<String, dynamic>>> getAllContacts() async {
    final db = await database;
    return await db.query('contacts');
  }

  // UPDATE
  Future<void> updateContact(int id, String name, String phone) async {
    final db = await database;
    await db.update(
      'contacts',
      {
        'name': name,
        'phone': phone,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ONE
  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ALL
  Future<void> deleteAllContacts() async {
    final db = await database;
    await db.delete('contacts');
  }
}
