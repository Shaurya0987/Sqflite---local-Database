import 'package:flutter/material.dart';
import 'package:localdb/local%20DataBase/secondListViewDB.dart';

class Secondlistviewprovider extends ChangeNotifier{
  DatabaseHelper2 db=DatabaseHelper2.instance;

  List<Map<String,dynamic>>items=[];

  Future<void>loadItems()async{
    items=await db.getItemss();
    notifyListeners();
  }

  Future<void>addItem(String image,String title,String description)async{
    await db.insertItem(image, title, description);
    loadItems();
  }
}