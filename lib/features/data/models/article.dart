import 'package:floor/floor.dart';
import '../../domain/entities/article.dart';
import 'article.dart';

@Entity(tableName: 'articles')
class ArticleModel extends ArticleEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  ArticleModel({
    this.id,
    required String title,
    required String description,
    required String urlToImage,
    required String publishedAt,
  }) : super(
    title: title,
    description: description,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
  );
}










// import 'package:floor/floor.dart';
// import 'package:news_app/features/domain/entities/article.dart';
//
// @Entity(tableName: 'article',primaryKeys: [])
// class ArticleModel extends ArticleEntity{
//   const ArticleModel({
//     int ? id,
//     String ? author,
//     String ? title,
//     String ? description,
//     String ? url,
//     String ? urlToImage,
//     String ? publishedAt,
//     String ? content,
//
// });
//
//   factory ArticleModel.fromJson(Map < String, dynamic> map){
//     return ArticleModel(
//       author: map['author'] ?? "",
//       title: map['title'] ?? "",
//       description: map['description'] ?? "",
//       url: map['url'] ?? "",
//       urlToImage: map['urlToImage'] ?? "",
//       publishedAt: map['publishedAt'] ?? "",
//       content: map['content'] ?? "",
//     );
//   }
//
//   factory ArticleModel.fromEntity(ArticleEntity entity){
//     return ArticleModel(
//       id: entity.id,
//       author: entity.author,
//       title: entity.title,
//       description: entity.description,
//       url: entity.url,
//       urlToImage: entity.urlToImage,
//       publishedAt: entity.publishedAt,
//       content: entity.content
//     );
//   }
//
//
// }