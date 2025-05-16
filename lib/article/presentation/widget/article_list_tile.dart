import 'package:article/article/model/article_summary.dart';
import 'package:article/article/presentation/screen/article_detail_screen.dart';
import 'package:flutter/material.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({required this.articleSummary, super.key});

  final ArticleSummary articleSummary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          articleSummary.thumbnail != null
              ? Image.network(articleSummary.thumbnail!)
              : null,
      title: Text(articleSummary.title),
      subtitle: Text(articleSummary.content),
      trailing: Text(articleSummary.createdAt.toString()),
      onTap: () {
        // Handle article tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ArticleDetailScreen(articleId: articleSummary.id),
          ),
        );
      },
    );
  }
}
