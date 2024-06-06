import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/domain/entities/article.dart';
import 'package:news_app/features/domain/repository/article_repository.dart';

import '../../../core/resources/data_state.dart';

class SaveArticleUseCase implements Usecase<void,ArticleEntity>{

  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.savedArticle(params!);
  }

}