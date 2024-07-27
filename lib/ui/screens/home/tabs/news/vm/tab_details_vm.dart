import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/common_widgets/error_view.dart';
import 'package:news_app/model_api/articles_response/ArticlesResponse.dart';
import '../../../../../../data/repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import '../../../../../../data/repos/news_repo/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../../../../data/repos/news_repo/news_repo_impl.dart';
import '../../../../../../model_api/articles_response/article.dart';
import '../../../home_screen.dart';

class TabDetailsViewModel extends Cubit<TabDetailsCubitState>{
  NewsRepoImpl newsRepo = NewsRepoImpl(NewsLocalDataSource(), NewsRemoteDataSource(), InternetConnectionChecker());
  TabDetailsViewModel(this.newsRepo) : super(TabDetailsCubitState());

  Future<void> loadArticlesList(String sourceId) async {

    emit(TabDetailsCubitState(apiState: ApiState.loading));
    try {
      ArticlesResponse articlesResponse = await newsRepo.loadArticlesList(sourceId);
      //articles = articlesResponse.articles!;
      emit(TabDetailsCubitState(apiState: ApiState.success, articles: articlesResponse.articles!) );

    } catch (e){
     // apiState = ApiState.error;
      //errorMessage = e.toString();
      emit(TabDetailsCubitState(apiState:  ApiState.error, errorMessage: e.toString()));
      throw e.toString();
    }
  }

  showError(BuildContext context, String message, VoidCallback onRefresh){
    return ErrorView(message: message, onRefreshTap:
    onRefresh
    );
  }
  navigateHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
}

  }

class TabDetailsCubitState{
  ApiState apiState ;
  List<Article> articles = [];
  String errorMessage = '';
  TabDetailsCubitState({this.apiState = ApiState.loading, this.errorMessage = '', this.articles = const [] });

}
enum ApiState {
  success , loading , error
}
