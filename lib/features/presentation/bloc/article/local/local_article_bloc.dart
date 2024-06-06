import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/domain/usecases/get_article.dart';
import 'package:news_app/features/domain/usecases/remove_article.dart';
import 'package:news_app/features/domain/usecases/saved_article.dart';
import 'package:news_app/features/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/presentation/bloc/article/local/local_article_state.dart';

import '../../../../domain/usecases/get_saved_article.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent,LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase,
      this._removeArticleUseCase,
      this._saveArticleUseCase,)
      :super(const LocalArticleLoading()){
    on <GetSavedArticles> (onGetSavedArticles);
    on <RemoveArticle> (onRemoveArticle);
    on <SaveArticle> (onSaveArticle);

  }

  void onGetSavedArticles(GetSavedArticles event ,Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void noRemoveArticle(RemoveArticle removeArticle,
      Emitter<LocalArticlesState>emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }
  void noSaveArticle(SaveArticle saveArticle,
      Emitter<LocalArticlesState>emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles =await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}