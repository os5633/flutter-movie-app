import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie2/app/controller/movie_list_controller.dart';
import 'package:movie2/app/data/model/movie_list_model.dart';
import 'package:movie2/app/ui/common/movie_grade.dart';

class SubMovieList extends StatelessWidget {
  const SubMovieList({
    Key? key,
    required this.movieListController,
    required this.list,
  }) : super(key: key);
  final MovieListController movieListController;
  final RxList<MovieList> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return subMovieItem(index);
      },
    );
  }

  InkWell subMovieItem(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed("/MovieDetailView/${list[index].id}");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 69,
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
                      "https://image.tmdb.org/t/p/w500/${list[index].posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].title,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MovieGrade(iconSize: 12, grade: list[index].voteAverage),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            list[index]
                                .genreIds
                                .map((id) => movieListController.findGenre(id))
                                .join(", "),
                            style: const TextStyle(
                                fontSize: 9,
                                color: Color(0xff9a9a9a),
                                fontWeight: FontWeight.w500)),
                        Text(
                          DateFormat("yyyy-MM-dd")
                              .format(list[index].releaseDate),
                          style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xff9a9a9a),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
