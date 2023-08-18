import 'package:flutter/material.dart';
import 'package:news_app/utils/custom_shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewBody extends StatelessWidget {
  const WebviewBody({
    super.key,
    required this.loadingProgress,
    required this.controller,
  });

  final double loadingProgress;
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        // loading progress indicator
        if (loadingProgress != 1)
          LinearProgressIndicator(
            value: loadingProgress,
          ),

        // body (web view)
        loadingProgress == 1
            ? Expanded(
                child: WebViewWidget(
                  controller: controller,
                ),
              )
            : Expanded(
                child: CustomShimmer(
                  child: Container(
                    width: size.width,
                    height: size.height,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
      ],
    );
  }
}
