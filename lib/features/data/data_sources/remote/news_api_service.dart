import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/data/models/article.dart';
import 'package:retrofit/http.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/v2/top-headlines')
  Future<HttpResponse<List<ArticlesModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
