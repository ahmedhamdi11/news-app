import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NoResultView extends StatelessWidget {
  const NoResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Animate(
              effects: const [
                FadeEffect(duration: Duration(milliseconds: 1200)),
                SlideEffect(
                  begin: Offset(1, 0),
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 1500),
                ),
              ],
              child: Image.asset(
                'assets/images/search.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Animate(
              effects: const [
                FadeEffect(),
                SlideEffect(
                  begin: Offset(0, 5),
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 1500),
                ),
              ],
              child: const Text(
                'Ops!, No results found',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
