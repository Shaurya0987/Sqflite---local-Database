import 'package:flutter/material.dart';

class ContactShowingScreen extends StatefulWidget {
  const ContactShowingScreen({super.key});

  @override
  State<ContactShowingScreen> createState() => _ContactShowingScreenState();
}

class _ContactShowingScreenState extends State<ContactShowingScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: contactTile(
          name: "Shaurya Thakur",
          phone: "7876340045",
        ),
      ),
    );
  }

  /// Contact Card Widget
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT SIDE (Avatar + Text)
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.contacts_rounded,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // 🔑 KEY FIX
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

          /// RIGHT ARROW
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
        ],
      ),
    );
  }
}
