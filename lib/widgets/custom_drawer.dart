import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/widgets/drawer_list_tile.dart';
import 'package:news_app/widgets/toggle_theme_switch.dart';

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
              child: Image.asset(
                'assets/images/newspaper.png',
              ),
            ),

            // home tile
            const DrawerListTile(
              title: Text('Home'),
              leadingIcon: IconlyBroken.home,
            ),

            // bookmarks tile
            const DrawerListTile(
              title: Text('Bookmarks'),
              leadingIcon: IconlyBroken.bookmark,
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
