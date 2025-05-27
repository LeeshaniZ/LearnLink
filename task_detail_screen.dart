import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final String taskTitle;
  TaskDetailScreen({required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(taskTitle),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Details for $taskTitle",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Task Description: Add more details",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Tasks", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
