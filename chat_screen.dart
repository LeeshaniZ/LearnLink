import 'dart:math';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [];
  final List<String> botReplies = [
    "That sounds interesting!",
    "Can you tell me more?",
    "I totally agree with you!",
    "Wow, that's a great point!",
    "I'm here to chat anytime!",
    "Haha, that's funny!",
    "I never thought about it that way.",
    "What do you think about this?",
    "That's a cool idea!",
    "Let's talk more about that!",
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({"text": _messageController.text, "isMe": true});
        _messageController.clear();
      });

      // Simulate a reply with a random delay between 1-3 seconds
      Future.delayed(Duration(seconds: Random().nextInt(3) + 1), () {
        setState(() {
          messages.add({
            "text": botReplies[Random().nextInt(botReplies.length)],
            "isMe": false,
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "assets/download.png",
              ), // Change to real image
              radius: 18,
            ),
            SizedBox(width: 10),
            Text("Student Chat", style: TextStyle(color: Colors.black)),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isMe = messages[index]["isMe"];
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/user_avatar.png"),
                          radius: 16,
                        ),
                      SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft:
                                isMe ? Radius.circular(12) : Radius.zero,
                            bottomRight:
                                isMe ? Radius.zero : Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4),
                          ],
                        ),
                        child: Text(
                          messages[index]["text"],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 22,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
