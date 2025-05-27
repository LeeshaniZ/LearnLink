import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Light background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome text
            Text(
              "Welcome to Your Dashboard!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 40),
            // Weekly Study Duration
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Weekly Study Duration:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "15 hours",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Completed Assignments
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Completed Assignments:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "5/10",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                ); // Navigate back to login screen
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Red background color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
