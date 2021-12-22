import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie2/app/controller/movie_list_controller.dart';
import 'package:movie2/app/ui/common/sub_title.dart';
import 'package:movie2/app/ui/list/now_playing_list.dart';
import 'package:movie2/app/ui/list/sub_movie_list.dart';

class MovieListView extends GetView<MovieListController> {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 23,
              ),
              const SubTitle(title: "현재 상영중"),
              Obx(
                () => controller.nowPlayingList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : NowPlayList(
                        movieListController: controller,
                      ),
              ),
              const SizedBox(
                height: 14,
              ),
              const SubTitle(title: "개봉 예정"),
              Obx(
                () => controller.upCommingList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SubMovieList(
                        movieListController: controller,
                        list: controller.upCommingList,
                      ),
              ),
              const SizedBox(
                height: 6,
              ),
              const SubTitle(title: "인기"),
              Obx(
                () => controller.popularList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SubMovieList(
                        movieListController: controller,
                        list: controller.popularList,
                      ),
              ),
              const SizedBox(
                height: 6,
              ),
              const SubTitle(title: "높은 평점"),
              Obx(
                () => controller.topRatedList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SubMovieList(
                        movieListController: controller,
                        list: controller.topRatedList,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
