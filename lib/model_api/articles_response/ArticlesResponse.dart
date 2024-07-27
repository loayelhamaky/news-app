import '../sources_responses/source.dart';
import 'article.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  ArticlesResponse({this.status, this.totalResults, this.articles, this.code, this.message});

  ArticlesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
    if (json['code'] != null) {
      code = json['code'];
    }
    if (json['message'] != null) {
      message = json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    if (code != null) {
      data['code'] = code;
    }
    if (message != null) {
      data['message'] = message;
    }
    return data;
  }
}


