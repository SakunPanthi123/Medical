// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical/API/apis.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     APIs.firestore.collection('diseases').doc().set({
      //       'id': '',
      //       'title': '',
      //       'category': '',
      //       'description': '',
      //       'subtitle': '',
      //       'imgUrl': '',
      //     });
      //   },
      //   child: Text('+'),
      // ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://media.istockphoto.com/id/1200677760/photo/portrait-of-handsome-smiling-young-man-with-crossed-arms.jpg?s=612x612&w=0&k=20&c=g_ZmKDpK9VEEzWw4vJ6O577ENGLTOcrvYeiLxi8mVuo="),
              ),
            ),
          )
        ],
      ),
    );
  }
}
