import 'package:article/article/model/comment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleCommentListTile extends StatelessWidget {
  const ArticleCommentListTile({required this.comment, super.key});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
      leading: CircleAvatar(
        //backgroundImage: NetworkImage(comment.author.profileImage),
        backgroundImage: CachedNetworkImageProvider(
          comment.author.profileImage,
        ),
        radius: 20,
      ),
      title: Text(
        comment.author.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.content),
          const SizedBox(height: 4),
          Text(
            DateFormat('HH:mm').format(comment.createdAt.toLocal()),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
