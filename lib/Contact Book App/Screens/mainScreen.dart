import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override 
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SQflite Test"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mobile Number",
              ),
            ),
            const SizedBox(height: 35),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// INSERT → SnackBar
                ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Data Inserted",
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    );
                  },
                  child: const Text(
                    "Insert",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                /// UPDATE → Toast
                ElevatedButton(
                  onPressed: () {
                    Fluttertoast.cancel();

                    Fluttertoast.showToast(
                      msg: "Data Updated",
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.black,
                      backgroundColor: Colors.amber,
                    );
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),

                /// CLEAR
                ElevatedButton(
                  onPressed: () {
                    nameController.clear();
                    numberController.clear();

                    Fluttertoast.showToast(
                      msg: "Everything Cleared",
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
