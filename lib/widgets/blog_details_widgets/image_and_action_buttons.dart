import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/bookmarks_provider.dart';
import 'package:news_app/utils/functions/share_url.dart';
import 'package:news_app/widgets/shimmer_widgets/image_placeholder_shimmer.dart';
import 'package:provider/provider.dart';

class BlogImageAndActionButtons extends StatelessWidget {
  const BlogImageAndActionButtons({
    super.key,
    required this.news,
  });
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // image
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Hero(
            tag: news.title + news.url,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: news.urlToImage == ''
                  ? Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/newspaper.png',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const SizedBox(
                        height: 300,
                        child: Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const ImagePlaceholderShimmer(),
                      imageUrl: news.urlToImage,
                    ),
            ),
          ),
        ),

        // floating action buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'bookmark',
              onPressed: () {
                Provider.of<BookmarksProvider>(
                  context,
                  listen: false,
                ).toggleBookmark(context, article: news);
              },
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).cardColor,
              child: Provider.of<BookmarksProvider>(context).isInBookmarks(news)
                  ? Icon(
                      IconlyBold.bookmark,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : const Icon(IconlyBroken.bookmark),
            ),
            const SizedBox(width: 8.0),
            FloatingActionButton(
              heroTag: 'share',
              onPressed: () => shareUrl(context, url: news.url),
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).cardColor,
              child: const Icon(IconlyBroken.send),
            ),
            const SizedBox(width: 8.0),
          ],
        )
      ],
    );
  }
}
