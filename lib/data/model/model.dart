class NewsModel {
  String? title;
  String? subtitle;
  String? img;

  NewsModel({this.title, this.subtitle, this.img});

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['img'] = this.img;
    return data;
  }
}