import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({
    super.key,
    required this.errMessage,
    this.onButtonPressed,
  });
  final String errMessage;
  final void Function()? onButtonPressed;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: ListView(
        children: [
          Lottie.asset(
            themeProvider.isDarkTheme
                ? 'assets/lottie/error_dark.json'
                : 'assets/lottie/error_light.json',
            height: h * 0.3,
          ),
          Text(
            errMessage,
            textAlign: TextAlign.center,
          ).animate(
            effects: [
              const FadeEffect(
                duration: Duration(milliseconds: 800),
              ),
              const SlideEffect(
                begin: Offset(2, 0),
                end: Offset.zero,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(seconds: 1),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor,
            ),
            onPressed: onButtonPressed,
            child: const Text(
              'Try again',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ).animate(
            effects: [
              const FadeEffect(
                duration: Duration(milliseconds: 800),
              ),
              const SlideEffect(
                begin: Offset(0, 4),
                end: Offset.zero,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(seconds: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
