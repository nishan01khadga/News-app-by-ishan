 import 'package:news_app/features/domain/entities/article.dart';

import '../../../core/resources/data_state.dart';

abstract class ArticleRepository{
  // Api methods
  Future <DataState<List<ArticleEntity>>> getNewsArticles();

  //database methods
Future<List<ArticleEntity>> getSavedArticle();

Future<void> savedArticle(ArticleEntity article);

Future<void> removeArticle(ArticleEntity article);


 }