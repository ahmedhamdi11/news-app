import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/widgets/webview_widgets/custom_bottom_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _controller;
  double loadingProgress = 0.0;

  @override
  void initState() {
    _controller = WebViewController()
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              loadingProgress = progress / 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'url',
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(IconlyBroken.arrow_left_2),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: () => _showModalSheet(),
              icon: const Icon(IconlyBroken.more_square),
            ),
          ],
        ),
        body: Column(
          children: [
            if (loadingProgress != 1)
              LinearProgressIndicator(
                value: loadingProgress,
              ),
            Expanded(
              child: WebViewWidget(
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showModalSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
      ),
      context: context,
      builder: (context) => CustomBottomSheet(
        controller: _controller,
      ),
    );
  }
}
