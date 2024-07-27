import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../../data/repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import '../../../../../../data/repos/news_repo/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../../../../data/repos/news_repo/news_repo_impl.dart';
import '../../../../../../model_api/sources_responses/source.dart';
import '../../../../../../model_api/sources_responses/sources_response.dart';

class TabListViewModel extends ChangeNotifier {
  TabsListState state = TabsListState.loading;
  List<Source> sources = [];
  String errorMessage = '';
  NewsRepoImpl newsRepo = NewsRepoImpl(NewsLocalDataSource(), NewsRemoteDataSource(),
      InternetConnectionChecker());

  Future<void> loadTabsList(String sourceId) async {
    state = TabsListState.loading;
    notifyListeners();
    try {
      SourcesResponse sourcesResponse = await newsRepo.loadTabsList(sourceId);
      state = TabsListState.success;
      sources = sourcesResponse.sources!;
      notifyListeners();
    } catch (e) {
      state = TabsListState.error;
      notifyListeners();
      errorMessage = e.toString();
      throw e.toString();
    }
  }
}

enum TabsListState { success, loading, error }
