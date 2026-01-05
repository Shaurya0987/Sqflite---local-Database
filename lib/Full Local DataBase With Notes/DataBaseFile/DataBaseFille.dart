import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesHelper {
  // Singleton instance
  static final NotesHelper instance = NotesHelper._internal();
  static Database? _database;

  NotesHelper._internal();

  /// Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  /// Initialize database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  /// Create table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT NOT NULL
      )
    ''');
  }

  // ================= CRUD OPERATIONS =================

  /// INSERT NOTE
  Future<void> insertNote(String title, String subtitle) async {
    final db = await database;
    await db.insert('notes', {
      'title': title,
      'subtitle': subtitle,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// READ ALL NOTES
  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return await db.query('notes', orderBy: 'id DESC');
  }

  /// UPDATE NOTE (THIS IS WHAT YOU ASKED)
  Future<void> updateNote(int id, String title, String subtitle) async {
    final db = await database;
    await db.update(
      'notes',
      {'title': title, 'subtitle': subtitle},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// DELETE SINGLE NOTE
  Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  /// CLEAR ALL NOTES
  Future<void> clearNotes() async {
    final db = await database;
    await db.delete('notes');
  }

  /// NEWEST NOTES FIRST
  Future<List<Map<String, dynamic>>> getNotesNewestFirst() async {
    final db = await database;
    return await db.query(
      'notes',
      orderBy: 'id DESC', // newest first
    );
  }
}
