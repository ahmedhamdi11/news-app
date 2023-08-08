import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/loading_shimmer/image_placeholder_loading.dart';

class ArticleItme extends StatelessWidget {
  const ArticleItme({super.key});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      width: w * 0.24,
                      height: w * 0.24,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const ImagePlaceholderLoading(),
                      imageUrl:
                          'https://play-lh.googleusercontent.com/QvTfA5WH0B4X04u_sxSBdb-PlO7Wj6yjeyJVzwoyUsefJPTXDE75QBKKJr1fyI5CHQq9',
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  // article title ,date
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'title ' * 20,
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text('🕑 Reading Time'),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.blue,
                                ),
                              ),
                              Text('8-8-2023' * 4),
                            ],
                          ),
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
    );
  }
}
