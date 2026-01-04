import 'package:flutter/material.dart';

class Listviewbuilderdemo2 extends StatelessWidget {
  const Listviewbuilderdemo2({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String,String>>items=[
      {
        "image" : "assets/outLookRestaurant.jpg",
        "title" : "Nordiac Expedition",
        "subtitle" :"i want to live my life freely and dont want to sat in stress for any other else,iykny i mean to say",
      },
      {
        "image" : "assets/picture1.jpg",
        "title" : "Nordiac Expedition",
        "subtitle" :"i want to live my life freely and dont want to sat in stress for any other else,iykny i mean to say" 
      },
      {
        "image" : "assets/picture2.jpg",
        "title" : "Nordiac Expedition",
        "subtitle" : "i want to live my life freely and dont want to sat in stress for any other else,iykny i mean to say" 
      },
      {
        "image" : "assets/picture3.jpg",
        "title" : "Nordiac Expedition",
        "subtitle" : "i want to live my life freely and dont want to sat in stress for any other else,iykny i mean to say" 
      },
      {
        "image" : "assets/picture17.jpg",
        "title" : "Nordiac Expedition",
        "subtitle" : "i want to live my life freely and dont want to sat in stress for any other else,iykny i mean to say"
      },
    ];

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
        child: items.isEmpty?
        Center(
          child: Text("No Items Present Here"),
        ):
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ContainerWidetofListviw(
              image: items[index]["image"]!, 
              title: items[index]["title"]!, 
              subtitle: items[index]["subtitle"]!
              );
          },
        )
        ),
      );
  }
}

class ContainerWidetofListviw extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const ContainerWidetofListviw({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 355,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 63, 35),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(24),
                  topEnd: Radius.circular(24),
                ),
      
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 35,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: 17,
                            ),
                          ),
                        ),
      
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade700,
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 40,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.bookmark, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
