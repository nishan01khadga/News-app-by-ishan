import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/domain/entities/article.dart';
import 'package:news_app/features/domain/repository/article_repository.dart';

import '../../../core/resources/data_state.dart';

class GetSavedArticleUseCase implements Usecase<List<ArticleEntity>,void>{

  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticle();
  }

}