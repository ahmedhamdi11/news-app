import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/blog_details_screen.dart';
import 'package:news_app/screens/webview_screen.dart';
import 'package:news_app/utils/cusom_page_route_tranition.dart';
import 'package:news_app/widgets/shimmer_widgets/image_placeholder_shimmer.dart';

class TopTrendingArticleItem extends StatelessWidget {
  const TopTrendingArticleItem({
    super.key,
    required this.news,
  });
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () => Navigator.of(context).push(
          CustomPageRouteTransition(
            page: BlogDetailsScreen(news: news),
            transitionType: TransitionTypeEnum.fade,
          ),
        ),
        child: Column(
          children: [
            Hero(
              tag: news.title + news.url,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: news.urlToImage == ''
                    ? Image.asset(
                        'assets/images/empty_image.jpg',
                        width: w,
                        height: w * 0.86,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        width: w,
                        height: w * 0.86,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeholder: (context, url) =>
                            const ImagePlaceholderShimmer(),
                        imageUrl: news.urlToImage,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    CustomPageRouteTransition(
                      page: WebviewScreen(
                        url: news.url,
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.link,
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      news.publishedAt,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
