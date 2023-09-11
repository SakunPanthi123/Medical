// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical/FirebaseConfig/firebase_options.dart';
import 'package:medical/NavBarPages/disease_page.dart';
import 'package:medical/NavBarPages/emergency.dart';
import 'package:medical/NavBarPages/home_page.dart';
import 'package:medical/NavBarPages/medicines.dart';
import 'package:medical/NavBarPages/my_acoount.dart';

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
  List pages = [
    HomePage(),
    DiseasePage(),
    EmergencyPage(),
    Medicines(),
    MyAccount()
  ];
  int index = 0;
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
      home: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sick),
              label: 'Disease',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emergency),
              label: 'Emergency',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication_liquid),
              label: 'Medicines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Account',
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
      ),
    );
  }
}
