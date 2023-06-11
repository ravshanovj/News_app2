import 'package:flutter/material.dart';
import 'package:news_app/data/service/service_page.dart';

class AddNewsProvider extends ChangeNotifier {
  NewsService newsService = NewsService();
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  void addNews() async {
    await newsService.addNews(
      title: titleController.text,
      subtitle: subtitleController.text,
    );
  }
}
