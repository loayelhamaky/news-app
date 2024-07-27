import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/%20constants/constants.dart';
import 'package:news_app/common_widgets/error_view.dart';
import '../../../../../model_api/sources_responses/sources_response.dart';
import '../../../../../ui/screens/splash/splash_screen.dart';
import '../../../../../model_api/articles_response/ArticlesResponse.dart';

 class NewsRemoteDataSource {
   Future<SourcesResponse> loadTabsList(String? sourceId) async {
    try {
      Uri url = Uri.parse(checkSourceId(sourceId));
      Response response = await get(url);
      SourcesResponse sourcesResponse =
          SourcesResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return sourcesResponse;
      } else {
        throw sourcesResponse.message ?? Constants.defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

   Future<ArticlesResponse> loadArticlesList(String sourceId) async {
    try {
      Uri url = Uri.parse(
          'https://newsapi.org/v2/everything?apiKey=56d6c133d19f43cd844b11c80d360462&sources=$sourceId');
      //"${Constants.baseUrl}/${Constants.articlesEndPoint}?apiKey=${Constants.apiKey}&sources=$sourceId");

      Response apiResponse = await get(url);
      ArticlesResponse articlesResponse =
          ArticlesResponse.fromJson(jsonDecode(apiResponse.body));
      if (apiResponse.statusCode >= 200 && apiResponse.statusCode < 300) {
        return articlesResponse;
      } else {
        // print('fail');
        // throw articlesResponse.message ?? "Something went wrong";
        throw ErrorView(
            message: articlesResponse.message ?? Constants.defaultErrorMessage,
            onRefreshTap: (BuildContext context) =>
                Navigator.pushReplacementNamed(
                    context, SplashScreen.routeName));
      }
    } catch (e) {
      rethrow;
    }
  }
  static checkSourceId(String? sourceId){
    if (sourceId == '' || sourceId == null){
      print('111111111111111111  id == null');
      return "https://newsapi.org/v2/top-headlines/sources?apiKey=56d6c133d19f43cd844b11c80d360462";
    } else {
      print('222222222222222222  id = $sourceId');
      return "https://newsapi.org/v2/top-headlines/sources?apiKey=56d6c133d19f43cd844b11c80d360462&category=$sourceId";}
  }
}
