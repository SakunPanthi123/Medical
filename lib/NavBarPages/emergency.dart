// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:medical/cards/msg_%20box.dart';
import 'package:medical/cards/msg_card.dart';


class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  final List<MessageCard> chatMessages = []; 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Call an Ambulance",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          FlutterPhoneDirectCaller.callNumber('+919106930860');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "CALL",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Ask for a doctor",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ASK",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 2,
                  color: Colors.indigo,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "HELP/SOS",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      return chatMessages[index];
                    },
                  ),
                ),
              ],
            ),
          ),
          ChatTypingBox(
            onSendMessage: (message) {
              setState(() {
                chatMessages.add(MessageCard(
                  message: message,
                  isSentByUser: true,
                ));
              });
            },
          ),
        ],
      ),
    );
  }
}
