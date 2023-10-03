// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  NewsCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.purple,
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('Read more of this news',
               style: TextStyle(color: Colors.purple),),
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
               ),

          ],
        ),
      ),
    );
  }
}