class News {
  final String? id;
  final String source;
  final String author;
  final String title;
  final String description;
  final Uri url;
  final Uri urlToImage;
  final String publishedAt;
  final String content;

  News({
    this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> item) {
    return News(
      id: item['source']['id'].toString(),
      source: item['source']['name'].toString(),
      author: item['author'].toString(),
      title: item['title'].toString(),
      description: item['description'].toString(),
      url: item['url'],
      urlToImage: item['urlToImage'],
      publishedAt: item['publishedAt'].toString(),
      content: item['content'].toString(),
    );
  }

  @override
  String toString() {
    return 'News(id: $id, source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.id == id &&
        other.source == source &&
        other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        source.hashCode ^
        author.hashCode ^
        title.hashCode ^
        description.hashCode ^
        url.hashCode ^
        urlToImage.hashCode ^
        publishedAt.hashCode ^
        content.hashCode;
  }
}
