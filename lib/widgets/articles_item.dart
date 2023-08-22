import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/blog_details_screen.dart';
import 'package:news_app/screens/webview_screen.dart';
import 'package:news_app/utils/cusom_page_route_tranition.dart';
import 'package:news_app/widgets/shimmer_widgets/image_placeholder_shimmer.dart';

class ArticleItme extends StatelessWidget {
  const ArticleItme({
    super.key,
    required this.news,
  });
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          CustomPageRouteTransition(
            page: BlogDetailsScreen(
              news: news,
            ),
            transitionType: TransitionTypeEnum.fade,
            duration: const Duration(milliseconds: 450),
            reverseDuratin: const Duration(milliseconds: 400),
          ),
        ),
        child: Material(
          color: Theme.of(context).cardColor,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: w * 0.15,
                height: w * 0.15,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: w * 0.15,
                  height: w * 0.15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Theme.of(context).cardColor,
                child: Row(
                  children: [
                    // article image
                    Hero(
                      tag: news.title + news.url,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          width: w * 0.24,
                          height: w * 0.24,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/empty_image.jpg',
                            fit: BoxFit.cover,
                          ),
                          placeholder: (context, url) =>
                              const ImagePlaceholderShimmer(),
                          imageUrl: news.urlToImage,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12.0),

                    // article title ,date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4.0),

                          // time ago
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('🕑 ${news.timeAgo}'),
                          ),

                          // date time and open link button
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
                              SizedBox(
                                width: w * 0.4,
                                child: Text(
                                  news.publishedAt,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
