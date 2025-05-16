import 'package:article/article/model/article.dart';
import 'package:article/article/model/article_summary.dart';
import 'package:article/common/model/paged_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'article_client.g.dart';

@RestApi(baseUrl: 'https://article.cmsong111.site')
abstract class ArticleClient {
  factory ArticleClient(Dio dio, {String baseUrl}) = _ArticleClient;

  @GET('/api/v1/articles')
  Future<PagedModel<ArticleSummary>> getArticles({
    @Query('page') int page = 0,
    @Query('size') int size = 10,
  });

  @GET('/api/v1/articles/{id}')
  Future<Article> getArticleById(@Path('id') int id);
}
