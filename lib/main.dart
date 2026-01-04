import 'package:flutter/material.dart';
import 'package:localdb/Contact%20Book%20App/Providers/contactProvider.dart';
import 'package:localdb/Contact%20Book%20App/Screens/mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  // REQUIRED for plugins like fluttertoast
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_)=>ContactProvider(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
