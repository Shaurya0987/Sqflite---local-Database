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
    final path = join(dbPath, 'student.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age TEXT,
        rollNo TEXT
      )
    ''');
  }

  // INSERT
  Future<void> insertStudent(String name, String age, String rollNo) async {
    final db = await database;
    await db.insert(
      'students',
      {'name': name, 'age': age, 'rollNo': rollNo},
    );
  }

  // READ ALL
  Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await database;
    return await db.query('students');
  }

  // UPDATE
  Future<void> updateStudent(int id, String name, String age, String rollNo) async {
    final db = await database;
    await db.update(
      'students',
      {'name': name, 'age': age, 'rollNo': rollNo},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ONE
  Future<void> deleteStudent(int id) async {
    final db = await database;
    await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ALL
  Future<void> deleteAllStudents() async {
    final db = await database;
    await db.delete('students');
  }

  // SORT BY NAME
  Future<List<Map<String, dynamic>>> getStudentsSortedByName() async {
    final db = await database;
    return await db.query('students', orderBy: 'name ASC');
  }
}
