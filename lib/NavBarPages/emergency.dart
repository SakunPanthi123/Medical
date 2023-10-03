// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical/cards/msg_%20box.dart';
import 'package:medical/cards/msg_card.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
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
                  padding: const EdgeInsets.only(right:8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Call an Ambulance",style: TextStyle(fontSize: 20,),),
                                   SizedBox(height: 10,),
                
                      ElevatedButton(
                        onPressed: (){}, 
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("CALL",style: TextStyle(fontSize: 20,),),
                      ),),
                            SizedBox(height: 20,),
                            Text("Ask for a doctor",style: TextStyle(fontSize: 20,),),
                             SizedBox(height: 10,),
                             ElevatedButton(
                        onPressed: (){}, 
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("ASK",style: TextStyle(fontSize: 20,),),
                      ),),
                    ],
                  ),
                ),
            SizedBox(height: 20,),
            Container(height: 2,color: Colors.indigo,),
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Text("HELP/SOS",style: TextStyle(fontSize: 20,),),
            ),
            MessageCard(message: "Help Emergency", isSentByUser: true),
            MessageCard(message: "Where are you?", isSentByUser: false),
            MessageCard(message: "My truck crashed.", isSentByUser: true),
            MessageCard(message: "I am in the Trisuli river", isSentByUser: true),
            MessageCard(message: "Ok we are dispatching.", isSentByUser: false),
            MessageCard(message: "Come fast, I am bleeding.", isSentByUser: true),
            MessageCard(message: "We'll ping your locationa and arrive in approximately 20 minutes.", isSentByUser: false),
            
                  
              ],
            ),
          ),
          ChatTypingBox(),
        ],

      ),
    );
  }
}
