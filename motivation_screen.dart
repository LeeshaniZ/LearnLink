import 'package:flutter/material.dart';
import './chat_screen.dart'; // Import the ChatScreen

class MotivationScreen extends StatelessWidget {
  final List<String> motivationalQuotes = [
    "Success is the sum of small efforts, repeated day in and day out.",
    "The only way to do great work is to love what you do.",
    "Success is not the key to happiness. Happiness is the key to success.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Motivational Quotes"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Navigate to the chat screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: motivationalQuotes.length,
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
                  motivationalQuotes[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueAccent,
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
