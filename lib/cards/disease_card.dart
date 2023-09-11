// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:medical/NonNavBarPages/details.dart';
import 'package:medical/models/disease_model.dart';

class DiseaseCard extends StatelessWidget {
  final Disease disease;

  const DiseaseCard({super.key, required this.disease});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            disease.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              disease.description.length > 100
                  ? '${disease.description.substring(0, 100)}...'
                  : disease.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your 'Learn More' button action here.
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DetailsPage(disease: disease)));
            },
            child: Text('Learn More'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.purple,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
