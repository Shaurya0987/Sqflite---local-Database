import 'package:flutter/material.dart';
import 'package:localdb/Full%20Local%20DataBase%20With%20Notes/Provider/NotesProvider.dart';
import 'package:localdb/Full%20Local%20DataBase%20With%20Notes/Screens/HomeScreen.dart';
import 'package:localdb/Providers/thirdListViewB.uilderProvider.dart';
import 'package:provider/provider.dart';

void main() {
  // REQUIRED for plugins like fluttertoast
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_)=>NotesProvider()..loadItems(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
