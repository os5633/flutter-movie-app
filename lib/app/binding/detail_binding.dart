import 'package:get/get.dart';
import 'package:movie2/app/controller/movie_detail_controller.dart';
import 'package:movie2/app/data/repository/movie_detail_repository.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
    Get.lazyPut(() => MovieDetailRepository());
  }
}
