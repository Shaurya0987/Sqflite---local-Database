import 'package:flutter/material.dart';
import 'package:localdb/local%20DataBase/databaseHelper.dart';

class DbTestScreen extends StatefulWidget {
  const DbTestScreen({super.key});

  @override
  State<DbTestScreen> createState() => _DbTestScreenState();
}

class _DbTestScreenState extends State<DbTestScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final db = DatabaseHelper.instance;

    return Scaffold(
      appBar: AppBar(title: const Text("SQflite Test")),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("name")
                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("age")
                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller: rollNoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("roll no")
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      db.insertStudent(nameController.text, ageController.text, rollNoController.text);
                    },
                    child: const Text("Insert"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await db.getAllStudents();
                      debugPrint(data.toString());
                    },
                    child: const Text("Read"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      db.deleteAllStudents();
                    },
                    child: const Text("Delete"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
