// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleSummary _$ArticleSummaryFromJson(Map<String, dynamic> json) =>
    ArticleSummary(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      thumbnail: json['thumbnail'] as String?,
      author: AuthorProfile.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ArticleSummaryToJson(ArticleSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'thumbnail': instance.thumbnail,
      'author': instance.author,
      'createdAt': instance.createdAt.toIso8601String(),
    };
