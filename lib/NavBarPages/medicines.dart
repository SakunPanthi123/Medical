// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Medicines extends StatefulWidget {
  const Medicines({Key? key});

  @override
  State<Medicines> createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  late String time;
  final TextEditingController medicineName = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    time = '';
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        time = picked.format(context);
      });
    }
  }

  Future<void> addMedicineToFirestore(String name, String selectedTime) async {
    try {
      await firestore.collection('medicines').add({
        'name': name,
        'time': selectedTime,
      });
    } catch (e) {
      print('Error adding medicine to Firestore: $e');
    }
  }

  Future<void> removeMedicineFromFirestore(String documentID) async {
    try {
      await firestore.collection('medicines').doc(documentID).delete();
    } catch (e) {
      print('Error removing medicine from Firestore: $e');
    }
  }

  

  @override
  Widget build(BuildContext context) {
    if (time.isEmpty) {
      final currentTime = TimeOfDay.now();
      time = currentTime.format(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Daily Medicines',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Add a new daily medicine'),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 198,
                                  child: TextField(
                                    controller: medicineName,
                                    decoration: InputDecoration(
                                      hintText: 'Enter medicine name',
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _selectTime(context);
                                  },
                                  child: Icon(Icons.watch_later),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final selectedTime = time.isNotEmpty
                                    ? time
                                    : TimeOfDay.now().format(context);

                                await addMedicineToFirestore(
                                    medicineName.text, selectedTime);

                                setState(() {
                                  // This section has been removed
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Add'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text('Add a new medicine'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('medicines').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final medicineDocs = snapshot.data!;
                  final medicineList = medicineDocs.docs;

                  return ListView.builder(
                    itemCount: medicineList.length,
                    itemBuilder: (context, index) {
                      final medicineData =
                          medicineList[index].data() as Map<String, dynamic>;
                      final documentID = medicineList[index].id;
                      final name = medicineData['name'] as String;
                      final time = medicineData['time'] as String;

                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                time,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  removeMedicineFromFirestore(documentID);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
