import 'package:flutter/material.dart';
import 'package:news_app/data/model/model.dart';
import 'package:news_app/data/service/service_page.dart';

class GetNewsProvider extends ChangeNotifier {
  GetNewsProvider() {
    getNews();
  }
  //? for intance
  NewsService newsService = NewsService();

  bool isLoading = false;
  String error = '';
  List<NewsModel> data = [];

  void getNews() async {
    isLoading = true;
    notifyListeners();
    await newsService.getNewsService().then((dynamic value) {
      if (value is List<NewsModel>) {
        isLoading = false;
        notifyListeners();
        data = value;
      } else {
        isLoading = false;
        notifyListeners();
        error = value.toString();
      }
    });
  }
}
