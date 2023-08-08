import 'package:flutter/material.dart';
import 'package:news_app/utils/custom_animated_loading.dart';

class ImagePlaceholderLoading extends StatelessWidget {
  const ImagePlaceholderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedloading(
        child: Container(
      color: Theme.of(context).hintColor,
    ));
  }
}
