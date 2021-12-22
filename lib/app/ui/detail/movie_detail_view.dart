import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie2/app/controller/movie_detail_controller.dart';
import 'package:movie2/app/ui/common/movie_grade.dart';
import 'package:movie2/app/ui/common/sub_title.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => controller.movieDetail.value.id == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailViewTop(),
                    const SizedBox(
                      height: 24,
                    ),
                    const SubTitle(title: "개요"),
                    overView(),
                    const SizedBox(
                      height: 24,
                    ),
                    const SubTitle(title: "주요 출연진"),
                    cast(),
                    const SubTitle(title: "리뷰"),
                    review(),
                  ],
                ),
        ),
      ),
    );
  }

  Obx review() {
    return Obx(
      () => controller.reviewList.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "리뷰가 없습니다.",
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 50),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.reviewList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(
                      bottom: controller.castList.length == index + 1 ? 0 : 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.reviewList[index].content,
                        style: const TextStyle(
                          color: Color(0xff616161),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          controller.reviewList[index].author,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color(0xffa1a1a1),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }

  SizedBox cast() {
    return SizedBox(
      height: 104,
      child: ListView.builder(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
        scrollDirection: Axis.horizontal,
        itemCount: controller.castList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(
                right: controller.castList.length == index + 1 ? 0 : 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  backgroundImage: CachedNetworkImageProvider(
                      controller.castList[index].profilePath),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    controller.castList[index].name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 8, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding overView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        child: Text(controller.movieDetail.value.overview.toString(),
            style: const TextStyle(
                height: 1.4,
                color: Color(0xff828282),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  Stack detailViewTop() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: Get.width,
            color: Colors.black,
            height: 297,
            child: Opacity(
              opacity: 0.4,
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500/${controller.movieDetail.value.posterPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              width: Get.width,
              height: 93,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: Get.mediaQuery.padding.top, left: 16),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration.zero,
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500/${controller.movieDetail.value.posterPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 152,
                        child: Text(
                          controller.movieDetail.value.title.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      controller.movieDetail.value.adult == true
                          ? Container(
                              alignment: Alignment.center,
                              width: 27,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xfff66060),
                                ),
                              ),
                              child: const Text(
                                "Adult",
                                style: TextStyle(
                                  fontSize: 7,
                                  color: Color(0xfff66060),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          : Container(
                              height: 12,
                            ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        controller.movieDetail.value.genres!
                            .map((_) => _.name)
                            .join(", ")
                            .toString(),
                        style: const TextStyle(
                            color: Color(0xffb9b9b9), fontSize: 11),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${DateFormat("yyyy-MM-dd").format(controller.movieDetail.value.releaseDate!)} ${controller.movieDetail.value.status == "Released" ? "발매" : "개봉 예정"}",
                        style: const TextStyle(
                            color: Color(0xffb9b9b9), fontSize: 11),
                      ),
                      Row(
                        children: [
                          MovieGrade(
                            grade: controller.movieDetail.value.voteAverage!,
                            iconSize: 19,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            controller.movieDetail.value.voteAverage.toString(),
                            style: const TextStyle(
                                color: Color(0xfff1c644),
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
