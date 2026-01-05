import 'package:flutter/material.dart';
import 'package:localdb/Full%20Local%20DataBase%20With%20Notes/DataBaseFile/DataBaseFille.dart';

class NotesProvider extends ChangeNotifier {
  final NotesHelper db = NotesHelper.instance;

  List<Map<String, dynamic>> items = [];

  Future<void> loadItems() async {
    items = await db.getNotes(); // ✅ store data
    notifyListeners();
  }

  Future<void> addItem(String title, String subtitle) async {
    await db.insertNote(title, subtitle);
    await loadItems(); // ✅ wait, then reload
  }

  Future<void>sortNotes()async{
    await db.getNotesNewestFirst();
    notifyListeners();
  }

  Future<void>clearAll()async{
    await db.clearNotes();
    notifyListeners();
  }
}
