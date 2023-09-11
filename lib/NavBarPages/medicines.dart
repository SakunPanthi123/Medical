import 'package:flutter/material.dart';

class Medicines extends StatefulWidget {
  const Medicines({super.key});

  @override
  State<Medicines> createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
      ),
    );
  }
}
