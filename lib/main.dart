import 'package:flutter/material.dart';
import 'package:localdb/Contact%20Book%20App/Providers/contactProvider.dart';
import 'package:localdb/Contact%20Book%20App/Screens/mainScreen.dart';
import 'package:localdb/Providers/firstListViewProvider.dart';
import 'package:localdb/Screens/ListViewBuilderDemo.dart';
import 'package:localdb/Screens/ListViewBuilderDemo2.dart';
import 'package:localdb/Screens/ListViewBuilderDemo3.dart';
import 'package:provider/provider.dart';

void main() {
  // REQUIRED for plugins like fluttertoast
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_)=>FirstItemProvider(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listviewbuilderdemo(),
    );
  }
}
