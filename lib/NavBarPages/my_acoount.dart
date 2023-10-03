// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical/login/signin_page.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
Map<String,String>? details;
String? name;
String? role;
late DocumentSnapshot doc;
@override
  void initState(){
  super.initState();
  getDetails();
}
  getDetails() async {
  doc = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
  name = doc['name'];
  role = doc['role'];
  setState(() {
    
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Column(
        children: [
          Center(
            child: ClipRRect(
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
            ),
          ),
          Text("Name  : ${name ?? "N/A"}"),
          Text("Role : ${role ?? "N/A"}"),
          ElevatedButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
          }, child: Text("Logout"),),

        ],
      ),
    );
  }
}
