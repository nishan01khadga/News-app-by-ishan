import 'dart:html';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/domain/entities/article.dart';

import '../../../core/resources/data_state.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/local/DAO/app_database.dart';
import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService,this._appDatabase);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: countryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() async {
   return _appDatabase.articleDeo.getArticle();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
  return _appDatabase.articleDeo.deleteArticle(ArticleModel.fromEntity(article));
    }

  @override
  Future<void> savedArticle(ArticleEntity article) {
    return _appDatabase.articleDeo.insertArticle(ArticleModel.fromEntity(article));
  }
}