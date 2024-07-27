import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';

import '../../../../ constants/constants.dart';

class AppBarView {
  static PreferredSizeWidget buildAppBar(BuildContext context, title) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.085,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      leading: Container(
        margin: const EdgeInsets.only(right: 20, left: 5),
        child: Builder(
          // Wrap with Builder to ensure context is within Scaffold's subtree
          builder: (context) => IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      backgroundColor: Constants.primaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
