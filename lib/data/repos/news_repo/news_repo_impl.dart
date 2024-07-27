import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/data/repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_app/data/repos/news_repo/data_sources/remote_data_source/news_remote_data_source.dart';
import 'package:news_app/data/repos/news_repo/news_repo.dart';
import '../../../model_api/articles_response/ArticlesResponse.dart';
import '../../../model_api/sources_responses/sources_response.dart';

 class NewsRepoImpl extends NewsRepo{
  InternetConnectionChecker internetConnectionChecker;
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;
  NewsRepoImpl(this.newsLocalDataSource, this.newsRemoteDataSource, this.internetConnectionChecker);

  @override
  Future<SourcesResponse> loadTabsList(String? sourceId) async {
    if (await internetConnectionChecker.hasConnection) {
      SourcesResponse sourcesResponse =
       await newsRemoteDataSource.loadTabsList(sourceId);
      newsLocalDataSource.saveTabs(sourceId?? '', sourcesResponse);
      //newsLocalDataSource.saveTheTabs(sourceId?? '', sourcesResponse);
      return sourcesResponse;

    } else {
      SourcesResponse sourcesResponse =
          await newsLocalDataSource.loadTabsList(sourceId);
      //await newsLocalDataSource.loadTheTabsList(sourceId);
      return sourcesResponse;
    }
  }

  @override
  Future<ArticlesResponse> loadArticlesList(String sourceId) async {
    if (await internetConnectionChecker.hasConnection) {
      ArticlesResponse articlesResponse =
          await newsRemoteDataSource.loadArticlesList(sourceId);
     // newsLocalDataSource.saveArticles(sourceId, articlesResponse);
      return articlesResponse;
    } else {
      ArticlesResponse articlesResponse =
          await newsLocalDataSource.loadArticlesList(sourceId);
      return articlesResponse;
    }
  }
}
