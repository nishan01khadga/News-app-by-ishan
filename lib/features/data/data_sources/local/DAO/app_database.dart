

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';

import '../../../models/article.dart';
import 'article_dao.dart';
part 'app_database.g.dart';

@Database(version:1,entities:[ArticleModel])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDeo;
}