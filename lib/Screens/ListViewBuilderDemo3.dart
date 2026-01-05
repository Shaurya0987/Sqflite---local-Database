import 'package:flutter/material.dart';

class Listviewbuilderdemo3 extends StatelessWidget {
  const Listviewbuilderdemo3({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String,String>>notes=[
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
      },
      {
        "title" : "Learn Biology",
        "description" : "Chapter 1 , 3 are important for the final term papers. this time the papers are arriving very soon"
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
        child:notes.isEmpty?
          Center(child: Text("No Notes Present")):
          ListView.builder (
            physics: BouncingScrollPhysics(),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return ListContainer(
                title: notes[index]["title"]!, 
                subtitle: notes[index]["description"]!);
            },
          )),
        
        );
      
  }
}

class ListContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const ListContainer({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        // height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.deepOrange.shade100,
              child: Icon(Icons.note_sharp,color: Colors.deepOrange,size: 30,),
            ),
            title: Text(title,style: TextStyle(fontSize: 17),),
            subtitle: Text(subtitle,style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600
            ),),
            trailing: Icon(Icons.arrow_forward_ios,size: 20,),
          ),
        ),
      ),
    );
  }
}