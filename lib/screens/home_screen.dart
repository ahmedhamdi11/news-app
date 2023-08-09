import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/utils/cusom_page_route_tranition.dart';
import 'package:news_app/widgets/drawer_widgets/custom_drawer.dart';
import 'package:news_app/widgets/home_widgets/home_screen_body.dart';

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
            onPressed: () => Navigator.of(context).push(
              CustomPageRouteTransition(
                page: const SearchScreen(),
                transitionType: TransitionTypeEnum.fade,
              ),
            ),
            icon: const Icon(IconlyBroken.search),
          )
        ],
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: const HomeScreenBody(),
    );
  }
}
