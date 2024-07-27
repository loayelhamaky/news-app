import 'package:news_app/model_api/sources_responses/source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  SourcesResponse({this.status, this.sources, this.code, this.message});

  SourcesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources!.add(Source.fromJson(v));
        if (json['code'] != null) {
          code = json['code'];
        }
        if (json['message'] != null) {
          message = json['message'];
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
      if (code != null) {
        data['code'] = code;
      }
      if (message != null) {
        data['message'] = message;
      }
    }
    return data;
  }
}
