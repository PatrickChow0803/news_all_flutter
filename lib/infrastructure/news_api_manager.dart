import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsAPIManager {
  static late final NewsAPIManager _instance;
  static late final String _newsKey;
  static late final String _newsBaseURL;

  factory NewsAPIManager() {
    _instance = NewsAPIManager._internal();
    _newsKey = dotenv.env['API_KEY']!;
    _newsBaseURL = "https://newsapi.org/v2/";
    return _instance;
  }
  NewsAPIManager._internal();

  static NewsAPIManager get instance => _instance;
  static String get newsKey => _newsKey;
  static String get newsBaseURL => _newsBaseURL;
}
