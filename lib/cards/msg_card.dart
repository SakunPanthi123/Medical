import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final bool isSentByUser;

  MessageCard({required this.message, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: isSentByUser
              ? BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(8),
                ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
