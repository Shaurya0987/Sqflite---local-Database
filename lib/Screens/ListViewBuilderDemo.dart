import 'package:flutter/material.dart';

class Listviewbuilderdemo extends StatelessWidget {
  const Listviewbuilderdemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        "image": "assets/outLookRestaurant.jpg",
        "title": "New Outlook Restaurant",
        "subtitle": "only for a hour sale",
      },
      {
        "image": "assets/picture1.jpg",
        "title": "Spagetti",
        "subtitle": "hot and soft",
      },
      {
        "image": "assets/outLookRestaurant.jpg",
        "title": "New Outlook Restaurant",
        "subtitle": "only for a hour sale",
      },
      {
        "image": "assets/picture1.jpg",
        "title": "Spagetti",
        "subtitle": "hot and soft",
      },
      {
        "image": "assets/outLookRestaurant.jpg",
        "title": "New Outlook Restaurant",
        "subtitle": "only for a hour sale",
      },
      {
        "image": "assets/picture1.jpg",
        "title": "Spagetti",
        "subtitle": "hot and soft",
      },
      {
        "image": "assets/outLookRestaurant.jpg",
        "title": "New Outlook Restaurant",
        "subtitle": "only for a hour sale",
      },
      {
        "image": "assets/picture1.jpg",
        "title": "Spagetti",
        "subtitle": "hot and soft",
      },
      {
        "image": "assets/picture2.jpg",
        "title": "Samose",
        "subtitle": "only for last 3 person left",
      },
      {
        "image": "assets/picture3.jpg",
        "title": "Pizza",
        "subtitle": "only 4 left",
      },
      {
        "image": "assets/picture3.jpg",
        "title": "Pizza",
        "subtitle": "only 4 left",
      },
      {
        "image": "assets/picture3.jpg",
        "title": "Pizza",
        "subtitle": "only 4 left",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
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
        child: items.isEmpty
            ? Center(
                child: Text(
                  "No Items Present in the List",
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 21),
                ),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return WidgetContainer(
                    image: items[index]["image"]!,
                    title: items[index]["title"]!,
                    subtitle: items[index]["subtitle"]!,
                  );
                },
              ),
      ),
    );
  }
}

class WidgetContainer extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const WidgetContainer({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
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
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
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
