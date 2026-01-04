import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:localdb/Contact Book App/Providers/contactProvider.dart';
import 'package:localdb/Contact Book App/Screens/ContactShowingScreen.dart';

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
    final provider = context.read<ContactProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Book"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// NAME
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),

            const SizedBox(height: 15),

            /// MOBILE NUMBER
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mobile Number",
              ),
            ),

            const SizedBox(height: 35),

            /// BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// INSERT
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        numberController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "Please enter all fields",
                        backgroundColor: Colors.red,
                      );
                      return;
                    }

                    await provider.addContact(
                      nameController.text.trim(),
                      numberController.text.trim(),
                    );

                    nameController.clear();
                    numberController.clear();

                    Fluttertoast.showToast(
                      msg: "Contact Added",
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ContactShowingScreen(),
                      ),
                    );
                  },
                  child: const Text("Insert"),
                ),

                /// CLEAR
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    nameController.clear();
                    numberController.clear();

                    Fluttertoast.showToast(
                      msg: "Fields Cleared",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  },
                  child: const Text("Clear"),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// GO TO CONTACT PAGE
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ContactShowingScreen(),
                  ),
                );
              },
              child: const Text(
                "Go to Contact Page",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
