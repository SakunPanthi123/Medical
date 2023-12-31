// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical/nav_home_screen.dart';

class APIs {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> signUp(String email, String password, String name, String age, String address, String role, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'age': age,
        'address': address,
        'role': role,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup successful')));

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NavScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NavScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
