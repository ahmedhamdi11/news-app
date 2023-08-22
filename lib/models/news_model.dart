import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/functions/calc_time_ago.dart';

part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String urlToImage;
  @HiveField(4)
  final String publishedAt;
  @HiveField(5)
  final String content;
  @HiveField(6)
  final String timeAgo;

  NewsModel({
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
