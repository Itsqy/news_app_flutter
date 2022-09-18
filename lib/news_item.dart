class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"] ?? "kosong",
        description: json["description"] ?? "kosong",
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            "https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png",
        publishedAt: DateTime.parse(
            json["publishedAt"] ?? DateTime.now().toIso8601String()),
        content: json["content"] ?? "kosong",
      );
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
