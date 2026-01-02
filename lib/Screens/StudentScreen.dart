import 'package:flutter/material.dart';
import 'package:localdb/Providers/databaseProvider.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final rollController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    rollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider + SQflite"),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              context.read<StudentProvider>().sortByName();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<StudentProvider>().deleteAll();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: ageController, decoration: const InputDecoration(labelText: "Age")),
            TextField(controller: rollController, decoration: const InputDecoration(labelText: "Roll No")),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                context.read<StudentProvider>().addStudent(
                      nameController.text.trim(),
                      ageController.text.trim(),
                      rollController.text.trim(),
                    );
                nameController.clear();
                ageController.clear();
                rollController.clear();
              },
              child: const Text("Add Student"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: provider.students.length,
                itemBuilder: (context, index) {
                  final student = provider.students[index];
                  return ListTile(
                    title: Text(student['name']),
                    subtitle: Text(
                        "Age: ${student['age']} | Roll: ${student['rollNo']}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context
                            .read<StudentProvider>()
                            .deleteStudent(student['id']);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
