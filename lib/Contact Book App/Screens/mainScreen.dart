import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 15,),
              SizedBox(height: 5,),
              TextField(
                controller: numberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("mobile number")
                ),
              ),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const Text("Insert",style: TextStyle(color: Colors.blue),),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      
                    },
                    child: const Text("Update",style: TextStyle(color: Colors.amber),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const Text("Clear",style: TextStyle(color: Colors.red),),
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