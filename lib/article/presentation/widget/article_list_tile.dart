import 'package:article/article/model/article_summary.dart';
import 'package:article/article/presentation/screen/article_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({required this.articleSummary, super.key});

  final ArticleSummary articleSummary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          articleSummary.thumbnail != null
              ? AspectRatio(
                aspectRatio: 1,
                child: ClipRect(
                  child: Image.network(
                    articleSummary.thumbnail!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
              )
              : null,
      title: Text(
        articleSummary.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articleSummary.content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${DateFormat('HH:mm').format(articleSummary.createdAt.toLocal())} - ${articleSummary.author.name}",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      trailing: null,
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
