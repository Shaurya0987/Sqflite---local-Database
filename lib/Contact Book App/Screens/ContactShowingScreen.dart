import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localdb/Contact Book App/Providers/contactProvider.dart';

class ContactShowingScreen extends StatelessWidget {
  const ContactShowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ContactProvider>();

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: const Text("Contacts"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: provider.contacts.isEmpty
            ? const Center(
                child: Text(
                  "No contacts found",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: provider.contacts.length,
                itemBuilder: (context, index) {
                  final contact = provider.contacts[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: contactTile(
                      name: contact["name"] ?? "",
                      phone: contact["phone"] ?? "",
                    ),
                  );
                },
              ), 
      ),
    );
  }

  Widget contactTile({
    required String name,
    required String phone,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey,
            child: Icon(Icons.contacts_rounded, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phone,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
