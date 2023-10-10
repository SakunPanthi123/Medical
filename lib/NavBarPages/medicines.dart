// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Medicines extends StatefulWidget {
  const Medicines({super.key});

  @override
  State<Medicines> createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  late String time;
  final TextEditingController medicineName = TextEditingController();
  final List<Map<String, String>> times = [];

  @override
  void initState() {
    super.initState();
    // Initialize time as an empty string in initState
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

  @override
  Widget build(BuildContext context) {
    // Initialize time with the current time in the build method
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
                              onPressed: () {
                                final selectedTime = time.isNotEmpty
                                    ? time
                                    : TimeOfDay.now().format(context);

                                setState(() {
                                  times.add({
                                    'name': medicineName.text,
                                    'time': selectedTime,
                                  });
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
              child: ListView.builder(
                itemCount: times.length,
                itemBuilder: (context, index) {
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
                            times[index]['name'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            times[index]['time'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
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
