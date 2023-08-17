import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/utils/cusom_page_route_tranition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isInCenter = false;
  bool _isRectangle = false;
  bool _isExpanded = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () {
      _isInCenter = true;
      setState(() {});
    });

    Timer(const Duration(milliseconds: 1500), () {
      _isRectangle = true;
      setState(() {});
    });
    Timer(const Duration(milliseconds: 4200), () {
      _isExpanded = true;
      setState(() {});
    });

    Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushAndRemoveUntil(
        CustomPageRouteTransition(
          page: const HomeScreen(),
          transitionType: TransitionTypeEnum.fade,
          duration: const Duration(milliseconds: 500),
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedAlign(
        alignment: _isInCenter ? Alignment.center : Alignment.topCenter,
        curve: Curves.elasticOut,
        duration: const Duration(milliseconds: 3000),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1600),
          curve: Curves.fastLinearToSlowEaseIn,
          width: _isExpanded
              ? w
              : _isRectangle
                  ? 160
                  : 20,
          height: _isExpanded
              ? h
              : _isRectangle
                  ? 60
                  : 20,
          decoration: BoxDecoration(
            color: _isExpanded
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: _isRectangle
              ? Center(
                  child: const Text(
                    'News App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate(
                    onComplete: (controller) =>
                        Future.delayed(const Duration(milliseconds: 1100))
                            .then((value) => controller.reverse()),
                    effects: [
                      const FadeEffect(duration: Duration(milliseconds: 750)),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
