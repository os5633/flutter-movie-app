class MovieDetail {
  MovieDetail({
    this.adult,
    this.genres,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.status,
    this.title,
    this.voteAverage,
  });

  bool? adult;
  List<Genre>? genres;
  int? id;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? status;
  String? title;
  num? voteAverage;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        adult: json["adult"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        id: json["id"],
        overview: json["overview"] == "" ? "상세설명이 없습니다." : json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        status: json["status"],
        title: json["title"],
        voteAverage: json["vote_average"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "id": id,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "title": title,
        "vote-average": voteAverage,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
