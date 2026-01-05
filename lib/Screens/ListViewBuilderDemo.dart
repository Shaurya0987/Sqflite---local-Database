import 'package:flutter/material.dart';
import 'package:localdb/Providers/firstListViewProvider.dart';
import 'package:provider/provider.dart';

class Listviewbuilderdemo extends StatelessWidget {
  const Listviewbuilderdemo({super.key});

  @override
  Widget build(BuildContext context) {
    // WATCH provider for UI updates
    final provider = context.watch<FirstItemProvider>();
    final items = provider.items;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        centerTitle: true,
        title: const Text("My items", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.arrow_back, size: 27, color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.more_vert_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: items.isEmpty
            ? Center(
                child: Text(
                  "No Items Present in the List",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 21,
                  ),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return WidgetContainer(
                    age: items[index]["age"],
                    title: items[index]["title"],
                    subtitle: items[index]["subtitle"],
                  );
                },
              ),
      ),

      /// TEMP BUTTON TO ADD DATA (SAFE PLACE)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FirstItemProvider>().addItem(
                "33",
                "Pizzss",
                "Only 100 left",
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class WidgetContainer extends StatelessWidget {
  final String age;
  final String title;
  final String subtitle;
  const WidgetContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(radius: 30, child: Text(age)),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            subtitle: Text(subtitle, style: TextStyle(fontSize: 13)),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ),
        ),
      ),
    );
  }
}
