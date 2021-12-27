class Review {
  Review({
    required this.author,
    required this.content,
  });

  String author;
  String content;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        author: json["author"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
      };
}
