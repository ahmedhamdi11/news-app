import 'package:flutter/material.dart';

class NoResultView extends StatelessWidget {
  const NoResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/search.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            const SizedBox(
              height: 22.0,
            ),
            const Text(
              'Ops!, No results found',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
