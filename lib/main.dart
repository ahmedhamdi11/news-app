import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/constents/theme_data.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/bookmarks_provider.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:news_app/utils/cache_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter<NewsModel>(NewsModelAdapter());
  Hive.openBox<NewsModel>('news_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BookmarksProvider()..getBookmarks(),
        ),
        ChangeNotifierProvider(
          create: (context) {
            //Notify about theme changes
            return ThemeProvider()..getThemeFromPrefs();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return HomeProvider()
              ..getAllNews()
              ..getTopTrending();
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
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
