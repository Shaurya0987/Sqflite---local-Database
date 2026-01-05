import 'package:flutter/material.dart';
import 'package:localdb/Providers/thirdListViewB.uilderProvider.dart';
import 'package:localdb/Screens/ListViewBuilderDemo3.dart';
import 'package:provider/provider.dart';

void main() {
  // REQUIRED for plugins like fluttertoast
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_)=>ThirdListViewBuilderProvider()..loadItems(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listviewbuilderdemo3(),
    );
  }
}
