import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ToggleThemeSwitch extends StatelessWidget {
  const ToggleThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => SwitchListTile(
        title: Text(
          themeProvider.isDarkTheme ? 'Dark' : 'Light',
        ),
        secondary: Icon(
          themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onChanged: (_) {
          themeProvider.toggleTheme();
        },
        value: themeProvider.isDarkTheme,
      ),
    );
  }
}
