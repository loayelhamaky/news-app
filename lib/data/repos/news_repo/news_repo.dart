import '../../../model_api/articles_response/ArticlesResponse.dart';
import '../../../model_api/sources_responses/sources_response.dart';

abstract class NewsRepo{
  Future<SourcesResponse> loadTabsList(String? sourceId);
  Future<ArticlesResponse> loadArticlesList(String sourceId);
}