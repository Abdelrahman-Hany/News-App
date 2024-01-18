import 'package:dio/dio.dart';
import 'package:news_app_try/models/artical_model.dart';

class NewsService {
  final dio = Dio();
  Future<List<ArticalModel>> getTopHeadlines({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=a8f48b229c224dc3ac37aac9504cd427&category=$category');
      Map<String, dynamic> jesonData = response.data;
      List<dynamic> artical = jesonData['articles'];

      List<ArticalModel> articalList = [];
      for (var artical in artical) {
        ArticalModel articalModel = ArticalModel(
          image: artical['urlToImage'],
          title: artical['title'],
          subtitle: artical['description'], 
          URL: artical['url'],
        );
        articalList.add(articalModel);
      }
      return articalList;
    } catch (e) {
      print('Network Error $e');
      return [];
    }
  }
}
