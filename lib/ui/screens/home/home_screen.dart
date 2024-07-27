import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/data/repos/news_repo/news_repo_impl.dart';
import 'package:news_app/ui/screens/home/home_vm/home_vm.dart';
import 'package:news_app/ui/screens/home/home_widgets/app_bar_view.dart';
import 'package:news_app/ui/screens/home/home_widgets/drawer_view.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_view.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list_sources/tabs_list_view.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_view.dart';
import 'package:provider/provider.dart';

import '../../../data/repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import '../../../data/repos/news_repo/data_sources/remote_data_source/news_remote_data_source.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home screen';
  static String? categoryId;
  static String? appBarTitle;
  NewsRepoImpl newsRepo = NewsRepoImpl(NewsLocalDataSource(), NewsRemoteDataSource(), InternetConnectionChecker());
  static void onCategoryClick(String? categoryId, String? categoryTitle, NewsRepoImpl newsRepo) async{
    if (categoryId == null) {
      return;
    } else {
      HomeScreen.categoryId = categoryId;
      HomeScreen.appBarTitle = categoryTitle;
      await newsRepo.loadTabsList(categoryId);
    }
  }

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeVm homeVm = HomeVm();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeVm,
      child: WillPopScope(
        onWillPop: () => homeVm.onWillPopTap(scaffoldKey, context),
        child: Scaffold(
          key: scaffoldKey, // Add this line to link the scaffoldKey to the Scaffold widget
          appBar: AppBarView.buildAppBar(
              context,
              HomeScreen.categoryId == null
                  ? 'Welcome to News App!'
                  : HomeScreen.appBarTitle),
          body: HomeScreen.categoryId == null ? TabsList(): TabsList( sourceId: HomeScreen.categoryId,),
          drawer: const DrawerView(),
        ),
      ),
    );
  }
}
