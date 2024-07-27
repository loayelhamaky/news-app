import 'package:flutter/material.dart';
import 'package:news_app/common_widgets/error_view.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_view.dart';
import 'package:news_app/ui/screens/home/tabs/news/tab_datails_articles/tab_details_view.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list_sources/widgets/tab_list_widgets.dart';
import 'package:news_app/ui/screens/home/tabs/news/vm/tab_list_vm.dart';
import 'package:provider/provider.dart';

class TabsList extends StatefulWidget {
  const TabsList({super.key, this.sourceId});
  static const String routeName = "Tabs List";
  final String? sourceId;

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  static int currentIndex = 0;
  var vm = TabListViewModel();

  @override
  void initState() {
    super.initState();
    vm.loadTabsList(widget.sourceId ?? '');
    currentIndex = 0;
  }

  void updateCurrentIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Builder(
        builder: (context) {
          vm = Provider.of<TabListViewModel>(context);
          if (vm.state == TabsListState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (vm.state == TabsListState.success) {
            return TabListWidgets.tabsList(
                vm.sources, true, context, currentIndex, updateCurrentIndex);
          } else {
            return ErrorView(
                message: vm.errorMessage,
                onRefreshTap: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                });
          }
        },
      ),
    );
  }
}
