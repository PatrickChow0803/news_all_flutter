import 'package:news_all_flutter/model/news.dart';

class NewsResponse<T> {
  late final List<News> news;
  late final String error;

  NewsResponse({
    required this.news,
    required this.error,
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    if (json["articles"] != null) {
      json["articles"].forEach((data) {
        news.add(News.fromJson(data));
      });
    }
    error = "";
  }

  NewsResponse.withError(String errorMsg) {
    error = errorMsg;
  }
}
