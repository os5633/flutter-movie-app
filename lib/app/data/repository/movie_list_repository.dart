import 'package:get/get.dart';
import 'package:movie2/app/contant.dart';
import 'package:movie2/app/data/model/genre_model.dart';
import 'package:movie2/app/data/model/movie_list_model.dart';

enum ListType { nowPlaying, upComing, popular, topRated }

class MovieListRepository extends GetConnect {
  static MovieListRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.themoviedb.org/3";
    super.onInit();
  }

  Future<List<MovieList>> loadMovieList(ListType listType) async {
    String url;

    if (listType == ListType.nowPlaying) {
      url = "/movie/now_playing?api_key=$movieApiKey";
    } else if (listType == ListType.upComing) {
      url = "/movie/upcoming?api_key=$movieApiKey";
    } else if (listType == ListType.popular) {
      url = "/movie/popular?api_key=$movieApiKey";
    } else if (listType == ListType.topRated) {
      url = "/movie/top_rated?api_key=$movieApiKey";
    } else {
      url = "/movie/now_playing?api_key=$movieApiKey";
    }

    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      List<dynamic> list = res.body['results'];
      return list.map<MovieList>((item) => MovieList.fromJson(item)).toList();
    }
  }

  Future<List<Genre>> loadGenre() async {
    String url = "/genre/movie/list?api_key=$movieApiKey";
    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      List<dynamic> list = res.body['genres'];
      return list.map<Genre>((item) => Genre.fromJson(item)).toList();
    }
  }
}
