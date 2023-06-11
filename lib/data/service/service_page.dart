import 'package:dio/dio.dart';
import 'package:news_app/core/constants/end_points_urls.dart';
import 'package:news_app/data/model/model.dart';

class NewsService {
  Future<dynamic> getNewsService() async {
    try {
      Response res = await Dio().get(EndPointsUrls.getNew);
      if (res.statusCode == 200) {
        return (res.data as List).map((e) => NewsModel.fromJson(e)).toList();
      } else {
        return res.statusMessage;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> addNews(
      {required String title, required String subtitle}) async {
    try {
      Response response = await Dio().post(EndPointsUrls.addNew,
          data: {
            "title": title,
            "subtitle": subtitle,
            "img":
                "https://avatars.mds.yandex.net/i?id=00b52be074874dc23aa628570534db9331d76d92-8356382-images-thumbs&n=13"
          },
          options: Options(contentType: 'application/json'));
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
}
