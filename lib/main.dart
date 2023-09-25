// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical/FirebaseConfig/firebase_options.dart';
import 'package:medical/NavBarPages/disease_page.dart';
import 'package:medical/NavBarPages/emergency.dart';
import 'package:medical/NavBarPages/home_page.dart';
import 'package:medical/NavBarPages/medicines.dart';
import 'package:medical/NavBarPages/my_acoount.dart';
import 'package:medical/login/signin_page.dart';
import 'package:medical/nav_home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool signedIn = false;
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      signedIn = true;
    } else {
      signedIn = false;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: TextTheme(
            titleMedium: TextStyle(
              color: Colors.purple,
            ),
            bodyMedium: TextStyle(
              color: Colors.purple,
            ),
            bodySmall: TextStyle(
              color: Colors.purple,
            ),
            labelMedium: TextStyle(
              color: Colors.purple,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.purple,
          ),
        ),
        home: signedIn == false ? SignInPage() : NavScreen());
  }
}
