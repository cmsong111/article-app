import 'package:flutter/material.dart';

class ArticlePostScreen extends StatefulWidget {
  const ArticlePostScreen({super.key});

  @override
  State<ArticlePostScreen> createState() => _ArticlePostScreenState();
}

class _ArticlePostScreenState extends State<ArticlePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Article')),
      body: Center(child: Text("Post your article here!")),
    );
  }
}
