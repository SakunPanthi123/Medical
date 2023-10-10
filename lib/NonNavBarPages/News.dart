import 'package:flutter/material.dart';
import 'package:medical/models/news_api_model.dart'; 

class ShowMorePage extends StatelessWidget {
  final Articles article;

  ShowMorePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? 'No Title Available',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              article.publishedAt ?? 'N/A',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.0),
            Image.network(
              article.urlToImage ?? 'placeholder_image_url',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            Text(
              article.description ?? 'No Description Available',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Content:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              article.content ?? 'No Content Available',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
