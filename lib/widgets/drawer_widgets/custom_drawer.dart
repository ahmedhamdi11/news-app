import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/screens/bookmarks_screen.dart';
import 'package:news_app/utils/cusom_page_route_tranition.dart';
import 'package:news_app/widgets/my_list_tile.dart';
import 'package:news_app/widgets/drawer_widgets/toggle_theme_switch.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            // drawer header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Column(
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'News App',
                    style: GoogleFonts.lobster(fontSize: 22.0),
                  ),
                ],
              ),
            ),

            // home tile
            MyListTile(
              title: const Text('Home'),
              leadingIcon: IconlyBroken.home,
              onTap: () => Navigator.of(context).pop(),
            ),

            // bookmarks tile
            MyListTile(
              title: const Text('Bookmarks'),
              leadingIcon: IconlyBroken.bookmark,
              onTap: () => Navigator.of(context).push(
                CustomPageRouteTransition(
                  page: const BookmarksScreen(),
                  transitionType: TransitionTypeEnum.fade,
                ),
              ),
            ),

            const Divider(endIndent: 8.0, indent: 8.0),

            // change theme tile
            const ToggleThemeSwitch(),
          ],
        ),
      ),
    );
  }
}
