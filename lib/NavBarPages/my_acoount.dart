import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical/login/signin_page.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Map<String, String>? details;
  String? name;
  String? role;
  String? age;
  String? address;
  late DocumentSnapshot doc;

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  getDetails() async {
    doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    name = doc['name'];
    role = doc['role'];
    age = doc['age'];
    address = doc['address'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1200677760/photo/portrait-of-handsome-smiling-young-man-with-crossed-arms.jpg?s=612x612&w=0&k=20&c=g_ZmKDpK9VEEzWw4vJ6O577ENGLTOcrvYeiLxi8mVuo="),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          role == 'Patient' ? "Patient Name: " : "Doctor Name: ",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          name ?? "N/A",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Age: ",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          age ?? "N/A",
                          style: TextStyle(
                                                fontWeight: FontWeight.bold,

                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Address: ",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          address ?? "N/A",
                          style: TextStyle(
                                                fontWeight: FontWeight.bold,

                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 300),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage(),
                  ),
                );
              },
              
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
