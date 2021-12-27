import 'package:get/get.dart';
import 'package:movie2/app/data/model/genre_model.dart';
import 'package:movie2/app/data/model/movie_list_model.dart';

import 'package:movie2/app/data/repository/movie_list_repository.dart';

class MovieListController extends GetxController {
  RxList<MovieList> nowPlayingList = RxList<MovieList>([]);
  RxList<MovieList> upCommingList = RxList<MovieList>([]);
  RxList<MovieList> popularList = RxList<MovieList>([]);
  RxList<MovieList> topRatedList = RxList<MovieList>([]);
  RxList<Genre> genreList = RxList<Genre>([]);

  @override
  void onInit() {
    loadNowPlayingList();
    loadUpCommingList();
    loadPopularList();
    loadTopRatedList();
    loadGenreList();
    super.onInit();
  }

  void loadNowPlayingList() async {
    List<MovieList> nowPlayingResult =
        await MovieListRepository.to.loadMovieList(ListType.nowPlaying);
    nowPlayingList(nowPlayingResult);
  }

  void loadUpCommingList() async {
    List<MovieList> upCommingListResult =
        await MovieListRepository.to.loadMovieList(ListType.upComing);
    upCommingList(upCommingListResult);
  }

  void loadPopularList() async {
    List<MovieList> popularListResult =
        await MovieListRepository.to.loadMovieList(ListType.popular);
    popularList(popularListResult);
  }

  void loadTopRatedList() async {
    List<MovieList> topRatedListResult =
        await MovieListRepository.to.loadMovieList(ListType.topRated);
    topRatedList(topRatedListResult);
  }

  void loadGenreList() async {
    List<Genre> genregResult = await MovieListRepository.to.loadGenre();
    genreList(genregResult);
  }

  String findGenre(int id) {
    if (genreList.isEmpty) return "-";
    final genre = genreList.firstWhere((element) => element.id == id);
    return genre.name;
  }
}
