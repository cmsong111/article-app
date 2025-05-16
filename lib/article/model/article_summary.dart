import 'package:article/article/model/author_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_summary.g.dart';

@JsonSerializable()
class ArticleSummary {
  final int id;
  final String title;
  final String content;
  final String? thumbnail;
  final AuthorProfile author;
  final DateTime createdAt;

  ArticleSummary({
    required this.id,
    required this.title,
    required this.content,
    this.thumbnail,
    required this.author,
    required this.createdAt,
  });

  factory ArticleSummary.fromJson(Map<String, dynamic> json) =>
      _$ArticleSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleSummaryToJson(this);
}
