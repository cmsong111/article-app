import 'package:article/article/api/article_client.dart';
import 'package:article/article/model/article.dart';
import 'package:article/article/presentation/widget/article_comment_list_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({required this.articleId, super.key});

  final int articleId;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final _articleClient = ArticleClient(Dio());
  late Future<Article> articleFuture;

  @override
  void initState() {
    super.initState();
    articleFuture = _articleClient.getArticleById(widget.articleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Article Detail'),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: Handle edit action
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // TODO: Handle delete action
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder<Article>(
                future: articleFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('오류: ${snapshot.error}'));
                  }

                  final article = snapshot.data!;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (article.images.isNotEmpty)
                          CarouselSlider(
                            items:
                                article.images
                                    .map(
                                      (url) => Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: url,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            placeholder:
                                                (context, url) => const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              autoPlay: false,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      article.author.profileImage,
                                    ),
                                    radius: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    article.author.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat(
                                      'yyyy.MM.dd HH:mm',
                                    ).format(article.createdAt.toLocal()),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                article.content,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 24),
                              const Divider(),
                              const Text(
                                '댓글',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              article.comments.isEmpty
                                  ? const Text(
                                    '댓글이 없습니다.',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                  : ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: article.comments.length,
                                    itemBuilder: (context, index) {
                                      return ArticleCommentListTile(
                                        comment: article.comments[index],
                                      );
                                    },
                                    separatorBuilder:
                                        (context, index) => const Divider(),
                                  ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
