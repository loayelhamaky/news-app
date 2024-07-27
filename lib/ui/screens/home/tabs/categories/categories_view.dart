import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/data/repos/news_repo/news_repo_impl.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/home_widgets/app_bar_view.dart';
import 'package:news_app/ui/screens/home/home_widgets/drawer_view.dart';
import 'package:news_app/ui/screens/home/tabs/categories/widgets/category_items.dart';

import '../../../../../data/repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import '../../../../../data/repos/news_repo/data_sources/remote_data_source/news_remote_data_source.dart';

class CategoriesView extends StatefulWidget {
  static const String routeName = 'categories';
  static bool inCategoriesView = false;
  CategoriesView({Key? key}) : super(key: key);
  NewsRepoImpl newsRepo = NewsRepoImpl(NewsLocalDataSource(), NewsRemoteDataSource(), InternetConnectionChecker());
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView.buildAppBar(context, 'News App'),
      drawer: const DrawerView(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(20), // Add padding to the bottom
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pick your category ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Color(0xff4F5A69),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'of interest ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Color(0xff4F5A69),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        CategoriesView.inCategoriesView = false;
                        chageNewsSource(CategoryItem.sports.id!, 'Sports', widget.newsRepo);
                        print(CategoryItem.sports.id!);
                      });

                    },
                    child: CategoryItem.sportsItem(
                        'Sports', 'lib/assets/images/img_1.png', Colors.red),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          CategoriesView.inCategoriesView = false;
                          chageNewsSource(CategoryItem.technology.id!, 'Technology', widget.newsRepo);
                          print(CategoryItem.technology.id!);
                        });

                      },
                      child: CategoryItem.technologyItem(
                          'Technology',
                          'lib/assets/images/img_9.png',
                          const Color(0xff003E90)))
                ],
              ),
              Row(
                children: [
                  InkWell(
                    child: CategoryItem.healthItem(
                        'Health',
                        'lib/assets/images/img_10.png',
                        const Color(0xffED1E79)),
                    onTap: () {
                      CategoriesView.inCategoriesView = false;
                      setState(() {
                        chageNewsSource(CategoryItem.health.id!, 'Health and beauty', widget.newsRepo);
                        print(CategoryItem.health.id!);
                      });

                    },
                  ),
                  InkWell(
                    child: CategoryItem.businessItem(
                      'business',
                      'lib/assets/images/img_6.png',
                      const Color(0xffCF7E48),
                    ),
                    onTap: () {
                      CategoriesView.inCategoriesView = false;
                      setState(() {
                        chageNewsSource(CategoryItem.business.id!, 'Business and E-Commerce', widget.newsRepo);
                        print(CategoryItem.business.id!);
                      });

                    },
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    child: CategoryItem.entertainmentItem('entertainment',
                        'lib/assets/images/img_7.png', const Color(0xff4882CF)),
                    onTap: () {
                      setState(() {
                        CategoriesView.inCategoriesView = false;
                        chageNewsSource(CategoryItem.entertainment.id!, 'Entertainment', widget.newsRepo);
                        print(CategoryItem.entertainment.id!);
                      });

                    },
                  ),
                  InkWell(
                    child: CategoryItem.scienceItem('Science',
                        'lib/assets/images/img_8.png', const Color(0xffF2D352)),
                    onTap: () {
                      setState(() {
                        CategoriesView.inCategoriesView = false;
                        chageNewsSource(CategoryItem.science.id!, 'Science', widget.newsRepo);
                        print(CategoryItem.science.id!);
                      });

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chageNewsSource(String sourceId, String? title, NewsRepoImpl newsRepo) async{
    HomeScreen.onCategoryClick(sourceId,title, newsRepo);
   await Navigator.pushNamed(context, HomeScreen.routeName);
  }
}
