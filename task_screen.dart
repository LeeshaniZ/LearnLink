import 'package:flutter/material.dart';
import 'post_share_screen.dart'; // Import the new screen
import 'task_detail_screen.dart'; // Add this import

class TaskScreen extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {"title": "Math Assignment", "deadline": "2025-04-05"},
    {"title": "Science Project", "deadline": "2025-04-10"},
    {"title": "English Essay", "deadline": "2025-04-12"},
  ];

  void navigateToTaskDetails(BuildContext context, String taskTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailScreen(taskTitle: taskTitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Your Tasks"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
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
                  tasks[index]["title"]!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Text(
                  "Deadline: ${tasks[index]["deadline"]}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                onTap:
                    () =>
                        navigateToTaskDetails(context, tasks[index]["title"]!),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostShareScreen()),
          );
        },
      ),
    );
  }
}
