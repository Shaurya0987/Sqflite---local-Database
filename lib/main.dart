import 'package:flutter/material.dart';
import 'package:localdb/Contact%20Book%20App/Screens/mainScreen.dart';
import 'package:localdb/Providers/databaseProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_)=>StudentProvider(),child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen(),
    );
  }
}

