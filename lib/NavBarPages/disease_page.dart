// ignore_for_file: prefer_const_constructors, unnecessary_cast, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical/API/apis.dart';
import 'package:medical/cards/disease_card.dart';
import 'package:medical/models/disease_model.dart';

class DiseasePage extends StatefulWidget {
  const DiseasePage({super.key});

  @override
  State<DiseasePage> createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseases'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: APIs.firestore.collection('diseases').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 400,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }

                  List<Disease> diseases = snapshot.data!.docs.map((document) {
                    Map<String, dynamic> diseases = document.data();
                    return Disease.fromJson(diseases);
                  }).toList();

                  List<String> category = [];
                  for (var element in diseases) {
                    if (!category.contains(element.category)) {
                      category.add(element.category);
                    }
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                category[index],
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 300,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: diseases.map((element) {
                                    return element.category == category[index]
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: DiseaseCard(
                                              disease: element,
                                            ),
                                          )
                                        : Column();
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
