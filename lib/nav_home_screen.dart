import 'package:flutter/material.dart';
import 'package:medical/NavBarPages/disease_page.dart';
import 'package:medical/NavBarPages/emergency.dart';
import 'package:medical/NavBarPages/home_page.dart';
import 'package:medical/NavBarPages/medicines.dart';
import 'package:medical/NavBarPages/my_acoount.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List pages = [
    const HomePage(),
    const DiseasePage(),
    const EmergencyPage(),
    const Medicines(),
    const MyAccount()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
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
    );
  }
}
