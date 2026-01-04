import 'package:flutter/material.dart';
import 'package:localdb/Contact Book App/Local DataBase/databaseHelper.dart';

class ContactProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper.instance;

  List<Map<String, dynamic>> contacts = [];

  /// READ DATA
  Future<void> getAllContacts() async {
    contacts = await db.getAllContacts();
    notifyListeners();
  }

  /// INSERT DATA
  Future<void> addContact(
    String name,
    String mobileNo,
  ) async {
    await db.insertContact(name, mobileNo);
    await getAllContacts();
  }

  /// UPDATE DATA
  Future<void> updateContact(
    int id,
    String name,
    String mobileNo,
  ) async {
    await db.updateContact(id, name, mobileNo);
    await getAllContacts();
  }

  /// DELETE ONE CONTACT
  Future<void> deleteContact(int id) async {
    await db.deleteContact(id);
    await getAllContacts();
  }

  /// CLEAR ALL CONTACTS
  Future<void> clearContacts() async {
    await db.deleteAllContacts();
    contacts = [];
    notifyListeners();
  }
}
