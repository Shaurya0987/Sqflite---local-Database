import 'package:flutter/material.dart';
import 'package:localdb/Full Local DataBase With Notes/Provider/NotesProvider.dart';
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

  final TextEditingController titleController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotesProvider>();
    final notes = provider.items;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: const Text("My Notes", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: notes.isEmpty
            ? const Center(child: Text("No Notes Present"))
            : Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Search any Notes")
                    ),
                    onChanged: (value) {
                      provider.searchNotes(searchController.text);
                    },
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: provider.sortNotes,
                        child: const Text("Newest"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          provider.clearAll();
                        },
                        child: const Text("Clear All"),
                      ),
                    ],
                  ),
                  const Divider(height: 40),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return ListContainer(
                          id: note["id"],
                          title: note["title"],
                          subtitle: note["subtitle"],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, provider),
        child: const Icon(Icons.add),
      ),
    );
  }

  // ================= ADD NOTE =================
  Future<void> _showAddDialog(
      BuildContext context, NotesProvider provider) {
    titleController.clear();
    subtitleController.clear();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(labelText: "Subtitle"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isEmpty ||
                    subtitleController.text.trim().isEmpty) {
                  return;
                }

                provider.addItem(
                  titleController.text.trim(),
                  subtitleController.text.trim(),
                );

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}


class ListContainer extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;

  const ListContainer({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.deepOrange.shade100,
          child: const Icon(Icons.note),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(onPressed: (){
          context.read<NotesProvider>().delete(id);
        }, icon: Icon(Icons.delete),color: Colors.red,),
        onTap: () => _showEditDialog(context),
      ),
    );
  }

  // ================= UPDATE NOTE =================
  void _showEditDialog(BuildContext context) {
    final titleCtrl = TextEditingController(text: title);
    final subtitleCtrl = TextEditingController(text: subtitle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleCtrl),
              const SizedBox(height: 10),
              TextField(controller: subtitleCtrl),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<NotesProvider>().updateNote(
                      id,
                      titleCtrl.text.trim(),
                      subtitleCtrl.text.trim(),
                    );
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }
}
