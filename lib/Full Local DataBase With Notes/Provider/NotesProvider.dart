import 'package:flutter/material.dart';
import 'package:localdb/Full Local DataBase With Notes/DataBaseFile/DataBaseFille.dart';

class NotesProvider extends ChangeNotifier {
  final NotesHelper db = NotesHelper.instance;

  List<Map<String, dynamic>> items = [];

  /// LOAD ALL NOTES
  Future<void> loadItems() async {
    items = await db.getNotes();
    notifyListeners();
  }

  /// ADD NOTE
  Future<void> addItem(String title, String subtitle) async {
    await db.insertNote(title, subtitle);
    await loadItems();
  }

  /// UPDATE NOTE 
  Future<void> updateNote(int id, String newTitle, String newSubtitle) async {
    await db.updateNote(id, newTitle, newSubtitle);
    await loadItems(); // IMPORTANT
  }

  /// SORT NEWEST FIRST 
  Future<void> sortNotes() async {
    items = await db.getNotesNewestFirst();
    notifyListeners();
  }

  /// CLEAR ALL NOTES 
  Future<void> clearAll() async {
    await db.clearNotes();
    items = [];
    notifyListeners();
  }

  Future<void>delete(int id)async{
    await db.deleteNote(id);
    loadItems();
  }

  /// 🔍 SEARCH NOTES
  void searchNotes(String query) {
    if (query.isEmpty) {
      items = List.from(items);
    } else {
      items = items.where((note) {
        final title = note["title"].toString().toLowerCase();
        final subtitle = note["subtitle"].toString().toLowerCase();
        final search = query.toLowerCase();

        return title.contains(search) || subtitle.contains(search);
      }).toList();
    }
    notifyListeners();
  }
}
