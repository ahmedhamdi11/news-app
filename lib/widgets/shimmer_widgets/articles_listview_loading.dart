import 'package:flutter/material.dart';
import 'package:news_app/utils/custom_shimmer.dart';

class ArticlesListViewShimmer extends StatelessWidget {
  const ArticlesListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const CustomShimmer(
<<<<<<< HEAD
        child: ArticlesShimmerItme(),
=======
        child: ArticlesLoadingItme(),
>>>>>>> 0a3e8377af1bf814440d675dcd4dac2dbbab87c3
      ),
    );
  }
}

class ArticlesShimmerItme extends StatelessWidget {
  const ArticlesShimmerItme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Container(
              width: w * 0.15,
              height: w * 0.15,
              color: Theme.of(context).hintColor,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: w * 0.15,
                height: w * 0.15,
                color: Theme.of(context).hintColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Theme.of(context).cardColor,
              child: Row(
                children: [
                  // article image
                  Container(
                    width: w * 0.24,
                    height: w * 0.24,
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  // article title ,date
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 26.0,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          height: 26.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
