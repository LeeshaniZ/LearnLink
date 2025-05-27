import 'package:flutter/material.dart';

class ResourceScreen extends StatelessWidget {
  final List<Map<String, String>> resources = [
    {"title": "Math Notes", "author": "John Doe"},
    {"title": "Physics Study Guide", "author": "Jane Smith"},
    {"title": "English Literature Essay", "author": "Emma Brown"},
  ];

  void upvoteResource(BuildContext context, String resourceTitle) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Upvoted $resourceTitle!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Study Resources"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  resources[index]["title"]!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Text(
                  "Author: ${resources[index]["author"]}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                  onPressed:
                      () => upvoteResource(context, resources[index]["title"]!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
