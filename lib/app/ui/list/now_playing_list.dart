import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie2/app/controller/movie_list_controller.dart';
import 'package:movie2/app/ui/common/movie_grade.dart';

class NowPlayList extends StatelessWidget {
  const NowPlayList({Key? key, required this.movieListController})
      : super(key: key);

  final MovieListController movieListController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemCount: movieListController.nowPlayingList.length,
        itemBuilder: (BuildContext context, int index) {
          return nowPlayingItem(index);
        },
      ),
    );
  }

  InkWell nowPlayingItem(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
            "/MovieDetailView/${movieListController.nowPlayingList[index].id}");
      },
      child: Container(
        margin: index + 1 == movieListController.nowPlayingList.length
            ? EdgeInsets.zero
            : const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 104,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fadeInDuration: Duration.zero,
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500/${movieListController.nowPlayingList[index].posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: 104,
              child: Text(
                movieListController.nowPlayingList[index].title.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            MovieGrade(
                iconSize: 12,
                grade: movieListController.nowPlayingList[index].voteAverage)
          ],
        ),
      ),
    );
  }
}
