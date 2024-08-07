import 'package:dio/dio.dart';
import 'package:news_app/models/artical_model.dart';

class NewsService {
  final Dio dio;
  //sdam

  const NewsService({required this.dio});

  Future<List<ArticalModel>> getNews({required String category}) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=04de2521cfaf462fa16591604612d9e6&category=$category',
    );

    Map<String, dynamic> jsonData = response.data;

    List<dynamic> articals = jsonData['articles'];

    List<ArticalModel> articalList = [];

    for (var art in articals) {
      ArticalModel articalModel = ArticalModel.fromJson(art);
      articalList.add(articalModel);
    }
    return articalList;
  }
}
