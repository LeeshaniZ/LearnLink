import 'package:flutter/material.dart';

class StudyGroupsScreen extends StatelessWidget {
  final List<Map<String, String>> groups = [
    {"name": "Math Study Group", "members": "10 members"},
    {"name": "Physics Study Group", "members": "8 members"},
    {"name": "English Literature", "members": "12 members"},
  ];

  void joinGroup(BuildContext context, String groupName) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Joined $groupName successfully!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Study Groups"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: groups.length,
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
                  groups[index]["name"]!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Text(
                  "Members: ${groups[index]["members"]}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueAccent, // Button background color
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => joinGroup(context, groups[index]["name"]!),
                  child: Text(
                    "Join",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
