import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: GoogleFonts.lobster(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBroken.search),
          )
        ],
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
    );
  }
}
