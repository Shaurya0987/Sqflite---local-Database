import 'package:flutter/material.dart';
import 'package:localdb/local DataBase/thirdListViewDB.dart';

class ThirdListViewBuilderProvider extends ChangeNotifier {
  final DatabaseHelper3 db = DatabaseHelper3.instance;

  List<Map<String, dynamic>> items = [];

  Future<void> loadItems() async {
    items = await db.getnotes(); // ✅ store data
    notifyListeners();
  }

  Future<void> addItem(String title, String subtitle) async {
    await db.insertItem(title, subtitle);
    await loadItems(); // ✅ wait, then reload
  }
}
