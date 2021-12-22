class Cast {
  Cast({
    required this.name,
    required this.profilePath,
  });

  String name;
  String profilePath;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        name: json["name"],
        profilePath: json["profile_path"] == null
            ? "https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_960_720.png"
            : "https://image.tmdb.org/t/p/w500/${json["profile_path"]}",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_path": profilePath,
      };
}
