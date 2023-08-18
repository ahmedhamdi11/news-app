import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/blog_details_widgets/blog_details_body.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.lobster(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrow_left_2),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlogDetailsBody(
        news: news,
      ),
    );
  }
}
