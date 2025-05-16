import 'package:article/article/model/author_profile.dart';
import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final int id;
  final String title;
  final String content;
  final List<String> images;
  final List<Comment> comments;
  final AuthorProfile author;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int viewCount;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.comments,
    required this.images,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    required this.viewCount,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
