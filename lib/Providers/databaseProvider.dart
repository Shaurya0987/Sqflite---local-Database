import 'package:flutter/material.dart';
import '../local DataBase/databaseHelper.dart';

class StudentProvider extends ChangeNotifier {
  final db = DatabaseHelper.instance;

  List<Map<String, dynamic>> students = [];

  // READ
  Future<void> getStudents() async {
    students = await db.getAllStudents();
    notifyListeners();
  }

  // ADD
  Future<void> addStudent(String name, String age, String rollNo) async {
    await db.insertStudent(name, age, rollNo);
    await getStudents();
  }

  // UPDATE
  Future<void> updateStudent(
      int id, String name, String age, String rollNo) async {
    await db.updateStudent(id, name, age, rollNo);
    await getStudents();
  }

  // DELETE ONE
  Future<void> deleteStudent(int id) async {
    await db.deleteStudent(id);
    await getStudents();
  }

  // DELETE ALL 
  Future<void> deleteAll() async {
    await db.deleteAllStudents();
    students = [];
    notifyListeners();
  }

  // SORT
  Future<void> sortByName() async {
    students = await db.getStudentsSortedByName();
    notifyListeners();
  }
}
