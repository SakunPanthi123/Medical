// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatTypingBox extends StatelessWidget {
  final Function(String) onSendMessage;

  ChatTypingBox({required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();

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
                  controller: _textController,
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
              final message = _textController.text;
              if (message.isNotEmpty) {
                onSendMessage(message);
                _textController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
