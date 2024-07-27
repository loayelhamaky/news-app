import 'dart:ui';

abstract class Constants {
  static const String baseUrl = 'https://newsapi.org';
  static const String apiKey = "fefd0fa15e8745d3b0af2a28e607e0aa";
  static const String sourcesEndPoint = "v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static const String defaultErrorMessage =
      'Something went wrong.. please try again later';
  static Color primaryColor = const Color(0xff39A552);
}
