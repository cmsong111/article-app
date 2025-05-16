import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({required this.articleId, super.key});

  final int articleId;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit action
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Handle delete action
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Article details will be displayed here!"),
      ),
    );
  }
}
