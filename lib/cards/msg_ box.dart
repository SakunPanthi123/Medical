// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ChatTypingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.purple,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle sending the message
            },
          ),
        ],
      ),
    );
  }
}
