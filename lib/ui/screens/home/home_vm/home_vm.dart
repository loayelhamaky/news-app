import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../tabs/categories/categories_view.dart';

class HomeVm extends ChangeNotifier {
  Future <bool> onWillPopTap(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) async{
    if (!scaffoldKey.currentState!.isDrawerOpen && HomeScreen.categoryId == null) {
      notifyListeners();
      CategoriesView.inCategoriesView = false;
      print('Drawer is closed, home screen open');
      return false; // Prevent back navigation

    } else if (CategoriesView.inCategoriesView) {
      print('In CategoriesView');
      HomeScreen.categoryId = null;
      CategoriesView.inCategoriesView = false;
      notifyListeners();
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      return true;

      // Allow back navigation
    } else {
      print('Drawer is open or drawer is closed and category is open');
      CategoriesView.inCategoriesView = false;
      HomeScreen.categoryId = null;
      notifyListeners();
      return true; // Allow back navigation
    }
  }
}
