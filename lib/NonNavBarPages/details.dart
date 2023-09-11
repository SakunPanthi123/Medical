// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical/models/disease_model.dart';

class DetailsPage extends StatelessWidget {
  final Disease disease;

  const DetailsPage({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), // Increased padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(Icons.info, 'Disease Rarity', disease.subtitle),
            SizedBox(height: 16), // Add spacing between rows
            _buildInfoRow(Icons.category, 'Category', disease.category),
            SizedBox(height: 16),
            _buildInfoRow(
                Icons.description, 'Description', disease.description),
          ],
        ),
      ),
    );
  }

  // Custom widget to display information with icons
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
        ), // Icon with increased size and color
        SizedBox(width: 16), // Add spacing between icon and text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18, // Increased font size for the label
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4), // Add spacing between label and value
              Text(
                value,
                style: TextStyle(
                    fontSize: 16), // Increased font size for the value
              ),
            ],
          ),
        ),
      ],
    );
  }
}
