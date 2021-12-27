import 'package:get/get.dart';
import 'package:movie2/app/binding/detail_binding.dart';
import 'package:movie2/app/ui/detail/movie_detail_view.dart';

import 'package:movie2/app/ui/list/movie_list_view.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => const MovieListView(),
  ),
  GetPage(
    name: "/MovieDetailView/:movieId",
    page: () => const MovieDetailView(),
    binding: DetailBinding(),
  ),
];
