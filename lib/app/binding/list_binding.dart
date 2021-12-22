import 'package:get/get.dart';
import 'package:movie2/app/controller/movie_list_controller.dart';
import 'package:movie2/app/data/repository/movie_list_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieListRepository());
    Get.lazyPut(() => MovieListController());
  }
}
