import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signup() {
    if (passwordController.text == confirmPasswordController.text) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup successful! Please log in.")),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
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
              "Sign Up",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 40),
            // Name TextField
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
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
            ),
            SizedBox(height: 20),
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
            // Confirm Password TextField
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm Password",
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
            // Signup Button with gradient effect
            ElevatedButton(
              onPressed: signup,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            // Login Button
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ),
              child: Text(
                "Already have an account? Log in",
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
