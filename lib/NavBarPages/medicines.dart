// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Medicines extends StatefulWidget {
  const Medicines({super.key});

  @override
  State<Medicines> createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  TextEditingController medicineName = TextEditingController();

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return picked;
  }

  @override
  Widget build(BuildContext context) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      controller: medicineName,
                                      decoration: InputDecoration(
                                          hintText: 'Enter medicine name'),
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
                                onPressed: () {},
                                child: Text('Add'),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text('Add a new medicine'),
            ),
          ],
        ),
      ),
    );
  }
}
