import 'package:flutter/material.dart';
import 'package:news_app/utils/cache_helper.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

import 'constents/theme_data.dart';

import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            //Notify about theme changes
            return ThemeProvider()..getThemeFromPrefs();
          },
        ),
      ],
      child:
          //Notify about theme changes
          Consumer<ThemeProvider>(
        builder: (context, themeProvider, ch) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
