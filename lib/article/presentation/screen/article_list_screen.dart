import 'package:article/article/api/article_client.dart';
import 'package:article/article/model/article_summary.dart';
import 'package:article/article/presentation/screen/article_post_screen.dart';
import 'package:article/article/presentation/widget/article_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final _logger = Logger();
  final _scrollController = ScrollController();

  final List<ArticleSummary> _articles = [];
  final _articleClient = ArticleClient(Dio());

  int _page = 0;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadInitialArticles();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_shouldLoadNextPage()) {
      _loadNextPage();
    }
  }

  bool _shouldLoadNextPage() {
    return !_isLoading &&
        _hasMore &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200;
  }

  Future<void> _loadInitialArticles() async {
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    setState(() => _isLoading = true);

    try {
      final response = await _articleClient.getArticles(page: _page);

      setState(() {
        _articles.addAll(response.content);
        _page++;
        _hasMore = _page < response.page.totalPages;
      });
    } catch (e, stack) {
      _logger.e("Failed to fetch articles", error: e, stackTrace: stack);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load articles')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _onRefresh() async {
    setState(() {
      _articles.clear();
      _page = 0;
      _hasMore = true;
    });

    await _loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article List')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Scrollbar(
          controller: _scrollController,
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            itemCount: _articles.length + (_hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= _articles.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return ArticleListTile(articleSummary: _articles[index]);
            },
            separatorBuilder: (_, __) => const Divider(height: 16),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ArticlePostScreen()),
          );
        },
        tooltip: 'Post Article',
        child: const Icon(Icons.edit),
      ),
    );
  }
}