import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/blog_details_widgets/image_and_action_buttons.dart';

class BlogDetailsBody extends StatelessWidget {
  const BlogDetailsBody({
    super.key,
    required this.news,
  });
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          // blog title
          Text(
            news.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 18.0),

          // date time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(news.publishedAt),
              Text(news.timeAgo),
            ],
          ),

          const SizedBox(height: 18.0),

          // image and action buttons (add to bookmarks, share)
          BlogImageAndActionButtons(
            news: news,
          ),

          const SizedBox(height: 22.0),

          // description
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            news.description,
          ),

          const SizedBox(height: 18.0),

          // content
          const Text(
            'Content',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            news.content,
          ),

          const SizedBox(height: 18.0),
        ],
      ),
    );
  }
}
