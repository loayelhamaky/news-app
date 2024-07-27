import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/data/repos/news_repo/news_repo_impl.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/tabs/news/tab_datails_articles/tab_datails_widgets/article_widget.dart';
import 'package:news_app/ui/screens/home/tabs/news/vm/tab_details_vm.dart';
import 'package:news_app/common_widgets/error_view.dart';
import 'package:news_app/model_api/articles_response/ArticlesResponse.dart';
import 'package:provider/provider.dart';
import '../../../../../../data/repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import '../../../../../../data/repos/news_repo/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../../../../model_api/articles_response/article.dart';

class TabDetails extends StatefulWidget {
  TabDetails({super.key, required this.sourceId});
  static const String routeName = 'Tab Details';
  final String sourceId;
  final NewsRepoImpl newsRepo = NewsRepoImpl(NewsLocalDataSource(),
      NewsRemoteDataSource(), InternetConnectionChecker());

  @override
  State<TabDetails> createState() => _TabDetailsState();
}

class _TabDetailsState extends State<TabDetails> {
  TabDetailsViewModel vm = TabDetailsViewModel(NewsRepoImpl(
      NewsLocalDataSource(),
      NewsRemoteDataSource(),
      InternetConnectionChecker()));

  @override
  void initState() {
    super.initState();
    vm.loadArticlesList(widget.sourceId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabDetailsViewModel, TabDetailsCubitState>(
        bloc: vm,
        builder: (context, state) {
          if (state.apiState == ApiState.loading) {
            return const CircularProgressIndicator();
          }
          if (state.apiState == ApiState.success) {
            return CupertinoScrollbar(child: articlesList(state.articles));
          } else {
            return vm.showError(
                context, 'error loading articles, please try again later',
                (){vm.navigateHome(context);});
          }
        });
  }

  Widget articlesList(List<Article?> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        // return articleWidget(articles[index]!);
        return ArticleWidget(article: articles[index]!, articles: articles);
      },
    );
  }
}
