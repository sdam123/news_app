import 'dart:convert';

import 'package:flutter/foundation.dart';

class ArticalModel {
  final String title;
  final String? subTitle;
  final String? image;
  final String url;

  ArticalModel(
      {required this.url,
      required this.title,
      required this.subTitle,
      required this.image});

  factory ArticalModel.fromJson(Json) {
    return ArticalModel(
        title: Json['title'],
        subTitle: Json['description'],
        image: Json['urlToImage'],
        url: Json['url']);
  }
}
