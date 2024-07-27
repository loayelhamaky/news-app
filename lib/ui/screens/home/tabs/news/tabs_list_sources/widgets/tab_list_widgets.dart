import 'package:flutter/material.dart';

import '../../../../../../../ constants/constants.dart';
import '../../../../../../../model_api/sources_responses/source.dart';
import '../../tab_datails_articles/tab_details_view.dart';
import '../tabs_list_view.dart';

abstract class TabListWidgets {
  Source source;
  bool isSelected;
  List sources;
  BuildContext context;


  TabListWidgets({ required this.source, required this.isSelected, required this.sources,
  required this.context, });

  static Widget tabsList(List<Source> sources,bool isSelected,BuildContext context, int currentIndex, Function onTab) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          buildTabBar(sources, currentIndex, onTab),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                height: MediaQuery.of(context).size.height *0.7,
                child: TabBarView(
                  children: sources.map((source) => TabDetails(sourceId: source.id!,)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  static Widget sourceWidget( Source source, bool isSelected, int currentIndex, List sources) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Constants.primaryColor, width: 1),
          color: isSelected
              ? Constants.primaryColor
              : Colors
              .white // color: source.isSelected == null || source.isSelected== false ? Colors.white : Colors.green ,
      ),
      child: Text(
        source.name ?? 'unknown',
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
  static Widget buildTabBar(List<Source> sources, int currentIndex, Function onTab) {
    return TabBar(
      onTap: (tappedIndex) {
       onTab(tappedIndex);
      },
      unselectedLabelColor: Colors.white,
      labelColor: Colors.black,
      isScrollable: true,
      indicatorColor: Constants.primaryColor,
      padding: const EdgeInsets.all(8),
      tabs: sources
          .map((source) => TabListWidgets.sourceWidget(
        source,
        currentIndex == sources.indexOf(source) ? true : false,
        sources.indexOf(source),
        sources,
      ))
          .toList(),
    );
  }


}

