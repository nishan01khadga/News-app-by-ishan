import 'package:equatable/equatable.dart';
import 'package:news_app/features/domain/entities/article.dart';

abstract class LocalArticlesState extends Equatable{
  final ArticleEntity ? article;

  const LocalArticlesState({this.article});

  @override
  List<Object> get props => [article!];
}
class LocalArticleLoading extends LocalArticlesState{
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticlesState{
  const LocalArticleDone(List<ArticleEntity>article):super(article: article);
}