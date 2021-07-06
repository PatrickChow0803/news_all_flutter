import 'package:dio/dio.dart';
import 'package:news_all_flutter/infrastructure/news_api_manager.dart';
import 'package:news_all_flutter/model/news.dart';
import 'package:news_all_flutter/model/news_response.dart';

class NewsService {
  static String _apiKey = NewsAPIManager.newsKey;
  static String _baseURL = NewsAPIManager.newsBaseURL;
  final Dio dio;

  NewsService(this.dio);

  Future<NewsResponse> getNews(String url) async {
    try {
      Response response = await dio.get(url);
      return NewsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewsResponse.withError("$error");
    }
  }

  Future<NewsResponse> getNewsList({
    String? query,
  }) async {
    String everything =
        '$_baseURL/everything?q=$query&from=2021-06-09&to=2021-06-09&sortBy=popularity&apiKey=$_apiKey';
    return getNews(everything);
  }

  Future<NewsResponse> getHeadLines({String country = 'us'}) {
    String everything =
        '$_baseURL/top-headlines?country=$country&apiKey=$_apiKey';
    return getNews(everything);
  }
}
