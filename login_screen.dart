import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'main_navigation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "test@example.com" && password == "password") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavigation()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid credentials!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Light background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 40),
            // Email TextField
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.blueAccent),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            // Password TextField
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.blueAccent),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Login Button with gradient effect
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Corrected property
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            // Signup Button
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  ),
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
