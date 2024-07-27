import 'package:flutter/material.dart';
import 'package:news_app/%20constants/constants.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_view.dart';
import '../tabs/categories/categories_view.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          ///title
          Container(
              color: Constants.primaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('News App!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              )),

          ///categories, settings
          Visibility(
            visible: HomeScreen.categoryId != null || CategoriesView.inCategoriesView ? true : false,
            child: InkWell(
              onTap: () {
                setState(() {
                  CategoriesView.inCategoriesView = false;
                  HomeScreen.categoryId = null;
                  Navigator.pushNamed(context, HomeScreen.routeName);
                });
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Row(children: [
                  const Icon(Icons.home, size: 35),
                  Container(
                    width: 10,
                  ),
                  const Text('Home',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ]),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, CategoriesView.routeName);
                CategoriesView.inCategoriesView = true;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Row(children: [
                const Icon(Icons.format_list_bulleted_outlined, size: 35),
                Container(
                  width: 10,
                ),
                const Text('Categories',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, SettingsView.routeName);
              });
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Row(children: [
                const Icon(
                  Icons.settings_rounded,
                  size: 35,
                ),
                Container(
                  width: 10,
                ),
                const Text('Settings',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
