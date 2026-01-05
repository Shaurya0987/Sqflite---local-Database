import 'package:flutter/material.dart';
import 'package:localdb/Full%20Local%20DataBase%20With%20Notes/Provider/NotesProvider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotesProvider>();
    final notes = provider.items;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: Text("My items", style: TextStyle(color: Colors.white)),
        leading: Icon(Icons.arrow_back, size: 27, color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.more_vert_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: notes.isEmpty
            ? Center(child: Text("No Notes Present"))
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          provider.sortNotes();
                        },
                        child: Text("Sort"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: Text("Update"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          provider.clearAll();
                        },
                        child: Text("Clear All"),
                      ),
                    ],
                  ),
                  Divider(height: 40,),
                  // SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return ListContainer(
                          title: notes[index]["title"]!,
                          subtitle: notes[index]["subtitle"]!,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogBoxx(context, provider);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> DialogBoxx(BuildContext context, NotesProvider provider) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Note"),
          actions: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Title..."),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("SubTitle..."),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.trim().isEmpty ||
                        subtitleController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Fill all the Detailsss")),
                      );
                      Navigator.pop(context);
                      return;
                    }

                    provider.addItem(
                      titleController.text.trim(),
                      subtitleController.text.trim(),
                    );

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Note Saved")));
                    titleController.clear();
                    subtitleController.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class ListContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const ListContainer({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        // height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.deepOrange.shade100,
              child: Icon(Icons.note_sharp, color: Colors.deepOrange, size: 30),
            ),
            title: Text(title, style: TextStyle(fontSize: 17)),
            subtitle: Text(
              subtitle,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ),
      ),
    );
  }
}
