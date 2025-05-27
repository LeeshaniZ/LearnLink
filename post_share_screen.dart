import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PostShareScreen extends StatefulWidget {
  @override
  _PostShareScreenState createState() => _PostShareScreenState();
}

class _PostShareScreenState extends State<PostShareScreen> {
  File? _image;
  final TextEditingController _captionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _sharePost() {
    if (_image != null && _captionController.text.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Post Shared Successfully!")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please add an image and caption.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
        backgroundColor: Colors.blueAccent,
        actions: [
          TextButton(
            onPressed: _sharePost,
            child: Text(
              "Share",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    _image == null
                        ? Center(
                          child: Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                            color: Colors.grey[700],
                          ),
                        )
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_image!, fit: BoxFit.cover),
                        ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                hintText: "Write a caption...",
                border: InputBorder.none,
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
