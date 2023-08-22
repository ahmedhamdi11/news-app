import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/providers/bookmarks_provider.dart';
import 'package:news_app/widgets/bookmarks_widgets/bookmarks_listview.dart';
import 'package:news_app/widgets/bookmarks_widgets/no_bookmarks_view.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarks',
          style: GoogleFonts.lobster(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrow_left_2),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Provider.of<BookmarksProvider>(context).bookmarks.isEmpty
          ? const NoBookmarksView()
          : const BookmarksListView(),
    );
  }
}
