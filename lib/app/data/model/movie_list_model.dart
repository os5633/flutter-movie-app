class MovieList {
  MovieList({
    required this.id,
    required this.posterPath,
    required this.genreIds,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  int id;
  List<int> genreIds;
  String posterPath;
  DateTime releaseDate;
  String title;
  num voteAverage;

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        id: json["id"],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        voteAverage: json["vote_average"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "vote_average": voteAverage,
      };
}
