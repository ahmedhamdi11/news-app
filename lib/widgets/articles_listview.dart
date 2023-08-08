import 'package:flutter/material.dart';
import 'package:news_app/widgets/articles_item.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => const ArticleItme(),
    );
  }
}
