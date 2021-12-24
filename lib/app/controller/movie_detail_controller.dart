import 'package:get/get.dart';
import 'package:movie2/app/data/model/cast_model.dart';
import 'package:movie2/app/data/model/movie_detail_modal.dart';
import 'package:movie2/app/data/model/review_model.dart';
import 'package:movie2/app/data/repository/movie_detail_repository.dart';

class MovieDetailController extends GetxController {
  Rx<MovieDetail> movieDetail = MovieDetail().obs;
  RxList<Cast> castList = RxList<Cast>([]);
  RxList<Review> reviewList = RxList<Review>([]);
  @override
  void onInit() {
    loadMovieDetail();
    loadCast();
    loadReview();
    super.onInit();
  }

  void loadMovieDetail() async {
    MovieDetail? movieDetailResult = await MovieDetailRepository.to
        .loadMovieeDetail(int.parse(Get.parameters["movieId"]!));
    movieDetail(movieDetailResult);
  }

  void loadCast() async {
    List<Cast> castListResult = await MovieDetailRepository.to
        .loadCast(int.parse(Get.parameters["movieId"]!));
    castList(castListResult);
  }

  void loadReview() async {
    List<Review> reviewListResult = await MovieDetailRepository.to
        .loadReview(int.parse(Get.parameters["movieId"]!));

    if (reviewListResult.isNotEmpty) {
      reviewList(reviewListResult);
    }
  }
}
