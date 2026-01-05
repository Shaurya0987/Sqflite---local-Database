import 'package:flutter/material.dart';
import 'package:localdb/local%20DataBase/firstListviewDb.dart';

class FirstItemProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper.instance;

  List<Map<String, dynamic>> items = [];

  Future<void> loadItems() async {
    items = await db.getItems();
    notifyListeners();
  }

  Future<void> addItem(String age, String title, String subtitle) async {
    await db.insertItem(age, title, subtitle);
    await loadItems();
  }
}
