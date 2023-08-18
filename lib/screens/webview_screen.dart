import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/widgets/webview_widgets/custom_bottom_sheet.dart';
import 'package:news_app/widgets/webview_widgets/webview_body.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key, required this.url});
  final String url;
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
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                loadingProgress = progress / 100;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
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
        appBar: _buildAppBar(context),
        body: WebviewBody(
          loadingProgress: loadingProgress,
          controller: _controller,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          widget.url,
        ),
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
    );
  }

  _showModalSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18.0),
        ),
      ),
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          url: widget.url,
          controller: _controller,
        );
      },
    );
  }
}
