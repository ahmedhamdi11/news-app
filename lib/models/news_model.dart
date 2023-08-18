class NewsModel {
  final String newsId,
      sourcName,
      authorName,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      dateToshow,
      readingTimeText;

  NewsModel({
    required this.newsId,
    required this.sourcName,
    required this.authorName,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.dateToshow,
    required this.readingTimeText,
  });

  factory NewsModel.fromJson(Map<String, dynamic> jsonData) {
    return NewsModel(
      newsId: jsonData['source']['id'] ?? '',
      sourcName: jsonData['source']['name'] ?? '',
      authorName: jsonData['author'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      url: jsonData['url'] ?? '',
      urlToImage: jsonData['urlToImage'] ?? '',
      publishedAt: jsonData['publishedAt'] ?? '',
      content: jsonData['content'] ?? '',
      dateToshow: 'dateToshow',
      readingTimeText: 'readingTimeText',
    );
  }
}
