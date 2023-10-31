// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical/NonNavBarPages/News.dart';
import 'package:medical/models/news_api_model.dart';

class NewsCard extends StatelessWidget {
  final Articles article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          article.urlToImage == null
              ? Image.asset(
                  'assets/logo.png',
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  article.urlToImage!,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo.png',
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title ?? 'No Title Available',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  article.description ?? 'No Description Available',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Published At: ${article.publishedAt ?? 'N/A'}',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowMorePage(article: article),
                      ),
                    );
                  },
                  child: Text('Show More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
