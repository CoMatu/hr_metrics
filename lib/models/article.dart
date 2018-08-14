import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {

  String get id;
  String get text;
  String get title;

  static Serializer<Article> get serializer => _$articleSerializer;

  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}