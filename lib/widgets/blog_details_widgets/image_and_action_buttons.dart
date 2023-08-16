import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/widgets/shimmer_widgets/image_placeholder_shimmer.dart';

class BlogImageAndActionButtons extends StatelessWidget {
  const BlogImageAndActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // image
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ImagePlaceholderShimmer(),
              imageUrl:
                  'https://play-lh.googleusercontent.com/QvTfA5WH0B4X04u_sxSBdb-PlO7Wj6yjeyJVzwoyUsefJPTXDE75QBKKJr1fyI5CHQq9',
            ),
          ),
        ),

        // floating action buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'bookmark',
              onPressed: () {},
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).cardColor,
              child: const Icon(IconlyBroken.bookmark),
            ),
            const SizedBox(width: 8.0),
            FloatingActionButton(
              heroTag: 'share',
              onPressed: () {},
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
