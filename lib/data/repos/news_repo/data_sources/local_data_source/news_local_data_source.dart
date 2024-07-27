import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../model_api/articles_response/ArticlesResponse.dart';
import '../../../../../model_api/sources_responses/sources_response.dart';
import '../remote_data_source/news_remote_data_source.dart';

class NewsLocalDataSource {
  List<Source> sources = [];
  late NewsRemoteDataSource newsRemoteDataSource;
  List<Source>? theSources = [];
  List<String>? names = [];
  Future<SourcesResponse> loadTabsList(
    String? sourceId,
  ) async {
    CollectionReference tabsCollection =
    FirebaseFirestore.instance.collection('tabs');
    if (sourceId == null || sourceId.isEmpty){
    DocumentSnapshot generalSnapshot = await tabsCollection.doc('general').get();
    Map<String, dynamic> generalJson = generalSnapshot.data() as Map<String,dynamic>;
    return SourcesResponse.fromJson(generalJson);
    }
    else{
      DocumentSnapshot snapshot = await tabsCollection.doc(sourceId).get();
      Map<String, dynamic> categoryJson = snapshot.data() as Map<String, dynamic>;
      return SourcesResponse.fromJson(categoryJson);

    }
  }


  Future<ArticlesResponse> loadArticlesList(String sourceId) async {
    throw '';
  }

  Future<void> saveTabs( String? sourceId, SourcesResponse sourcesResponse) async{
    CollectionReference tabsCollection =
        FirebaseFirestore.instance.collection('tabs');
    if (sourceId == null || sourceId.isEmpty){
    print('source id is empty = $sourceId ');
      print(" saved tabs in the doc general");
      await tabsCollection.doc('general').set(sourcesResponse.sources);}
    else if (sourceId == 'sports') {
      print(" saved tabs in the doc $sourceId");
      await tabsCollection.doc('sports').set(sourcesResponse.toJson());
    } else if (sourceId == 'technology') {
      print(" saved tabs in the doc $sourceId");
      await tabsCollection.doc('technology').set(sourcesResponse.toJson());
    } else if (sourceId == 'health') {
      print(" saved tabs in the doc $sourceId");
      await tabsCollection.doc('health').set(sourcesResponse.toJson());
    } else if (sourceId == 'business') {
      print(" saved tabs in the doc $sourceId");
      await tabsCollection.doc('business').set(sourcesResponse.toJson());
    } else if (sourceId == 'entertainment') {
      print(" saved tabs in the doc $sourceId");
      await tabsCollection.doc('entertainment').set(sourcesResponse.toJson());
    } else {
      print(" saved tabs in the doc $sourceId");
      await tabsCollection.doc('science').set(sourcesResponse.toJson());
    }
  }


  Future loadTheTabsList( String? sourceId,) async {
    CollectionReference tabsCollection =
    FirebaseFirestore.instance.collection('the tabs');
    if (sourceId == null || sourceId.isEmpty){
      DocumentSnapshot generalSnapshot = await tabsCollection.doc('general').get();
      Map<String, dynamic> generalJson = generalSnapshot.data() as Map<String,dynamic>;
      print(generalJson['name'] );
      generalJson.forEach((key, value) {
        names!.add(generalJson['name']);
      });
      return names;

    }
    else{
      DocumentSnapshot snapshot = await tabsCollection.doc(sourceId).get();
      Map<String, dynamic> categoryJson = snapshot.data() as Map<String, dynamic>;
      print(categoryJson['name']);
      categoryJson.forEach((key, value) {
        names!.add(categoryJson['name']);
      });
      return names;

    }
  }
  // Future<void> saveTheTabs(String sourceId, SourcesResponse sourcesResponse) async {
  //   CollectionReference collectionReference = FirebaseFirestore.instance.collection('the tabs');
  //   for (var source in sourcesResponse.sources!) {
  //     if (sourceId.isEmpty){
  //       collectionReference.doc('general').set({'name' : source.name } );
  //       print(" saved tabs in the doc general");
  //     }     else if (sourceId == 'sports') {
  //       print(" saved tabs in the doc $sourceId");
  //       await collectionReference.doc('sports').set({'name' : source.name });
  //     } else if (sourceId == 'technology') {
  //       print(" saved tabs in the doc $sourceId");
  //       await collectionReference.doc('technology').set({'name' : source.name });
  //     } else if (sourceId == 'health') {
  //       print(" saved tabs in the doc $sourceId");
  //       await collectionReference.doc('health').set({'name' : source.name });
  //     } else if (sourceId == 'business') {
  //       print(" saved tabs in the doc $sourceId");
  //       await collectionReference.doc('business').set({'name' : source.name });
  //     } else if (sourceId == 'entertainment') {
  //       print(" saved tabs in the doc $sourceId");
  //       await collectionReference.doc('entertainment').set({'name' : source.name });
  //     } else {
  //       print(" saved tabs in the doc $sourceId");
  //       await collectionReference.doc('science').set({'name' : source.name });
  //     }
  //   }
  // }
  //
  // Future<void> saveArticles(  String sourceId, ArticlesResponse articlesResponse) async {
  //   throw '';
  // }
}
