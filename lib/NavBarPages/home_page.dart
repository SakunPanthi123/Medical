// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical/cards/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latest news about flu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              NewsCard(title: "Flue has overtaken covid to become the new deadly pandemic in over 200 countries", description: "The flu of 2023 has become on the viral pandemic to ever occur in recent memory. It has affected a total of 200 million people across the globe causing mass hysteria and panic among children and adults alike. This has led to WHO to consider it one of the dealiest forms of human panic to ever occur exaggerated by the use of social media like facebook nd twitter.", onTap: (){}),
              SizedBox(
                height: 10,
              ),
                          NewsCard(title: "Flue has overtaken covid to become the new deadly pandemic in over 200 countries", description: "The flu of 2023 has become on the viral pandemic to ever occur in recent memory. It has affected a total of 200 million people across the globe causing mass hysteria and panic among children and adults alike. This has led to WHO to consider it one of the dealiest forms of human panic to ever occur exaggerated by the use of social media like facebook nd twitter.", onTap: (){}),
               SizedBox(
                height: 10,
              ),
              NewsCard(title: "Flue has overtaken covid to become the new deadly pandemic in over 200 countries", description: "The flu of 2023 has become on the viral pandemic to ever occur in recent memory. It has affected a total of 200 million people across the globe causing mass hysteria and panic among children and adults alike. This has led to WHO to consider it one of the dealiest forms of human panic to ever occur exaggerated by the use of social media like facebook nd twitter.", onTap: (){}),
              SizedBox(
                height: 10,
              ),
              NewsCard(title: "Flue has overtaken covid to become the new deadly pandemic in over 200 countries", description: "The flu of 2023 has become on the viral pandemic to ever occur in recent memory. It has affected a total of 200 million people across the globe causing mass hysteria and panic among children and adults alike. This has led to WHO to consider it one of the dealiest forms of human panic to ever occur exaggerated by the use of social media like facebook nd twitter.", onTap: (){}),
      SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
