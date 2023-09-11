// ignore_for_file: prefer_const_constructors

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
    );
  }
}
