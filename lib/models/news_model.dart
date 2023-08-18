import 'package:intl/intl.dart';
import 'package:news_app/utils/functions/calc_time_ago.dart';

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
      timeAgo;

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
    required this.timeAgo,
  });

  factory NewsModel.fromJson(Map<String, dynamic> jsonData) {
    String publishedAt = '';
    String timeAgo = '';
    if (jsonData['publishedAt'] != null) {
      DateTime publishedAtDateTime = DateTime.parse(jsonData['publishedAt']);
      publishedAt = DateFormat('MMM d, yyyy on h:mm a')
          .format(publishedAtDateTime)
          .toString();

      timeAgo = calculateTimeAgo(publishedAtDateTime);
    }
    return NewsModel(
      newsId: jsonData['source']['id'] ?? '',
      sourcName: jsonData['source']['name'] ?? '',
      authorName: jsonData['author'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? 'No description found',
      url: jsonData['url'] ?? '',
      urlToImage: jsonData['urlToImage'] ?? '',
      publishedAt: publishedAt,
      content: jsonData['content'] ?? 'No content found',
      timeAgo: timeAgo,
    );
  }
}
