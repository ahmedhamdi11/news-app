import 'package:flutter/material.dart';
import 'package:news_app/utils/custom_shimmer.dart';

class ImagePlaceholderShimmer extends StatelessWidget {
  const ImagePlaceholderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
        child: Container(
      color: Theme.of(context).hintColor,
    ));
  }
}
