import 'package:get/get.dart';
import 'package:movie2/app/contant.dart';
import 'package:movie2/app/data/model/cast_model.dart';
import 'package:movie2/app/data/model/movie_detail_modal.dart';
import 'package:movie2/app/data/model/review_model.dart';

class MovieDetailRepository extends GetConnect {
  static MovieDetailRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.themoviedb.org/3";
    super.onInit();
  }

  Future<MovieDetail> loadMovieeDetail(int id) async {
    String url = "/movie/$id?api_key=$movieApiKey&language=ko";

    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      return MovieDetail.fromJson(res.body);
    }
  }

  Future<List<Cast>> loadCast(int id) async {
    String url = "/movie/$id/casts?api_key=$movieApiKey";
    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      List<dynamic> list = res.body["cast"];
      return list.map<Cast>((item) => Cast.fromJson(item)).toList();
    }
  }

  Future<List<Review>> loadReview(int id) async {
    String url = "/movie/$id/reviews?api_key=$movieApiKey";
    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      List<dynamic> list = res.body["results"];
      return list.map<Review>((item) => Review.fromJson(item)).toList();
    }
  }
}
