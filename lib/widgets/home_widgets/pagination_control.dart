import 'package:flutter/material.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/widgets/home_widgets/page_number_button.dart';
import 'package:news_app/widgets/home_widgets/pagination_button.dart';
import 'package:provider/provider.dart';

class PaginationController extends StatefulWidget {
  const PaginationController({super.key});

  @override
  State<PaginationController> createState() => _PaginationControllerState();
}

class _PaginationControllerState extends State<PaginationController> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          // go to the previus page
          PaginationButton(
            onPressed: () {
              if (currentIndex > 0) {
                setState(() {
                  currentIndex -= 1;
                });
                homeProvider.getAllNews(
                  pageNumber: (currentIndex + 1).toString(),
                );
              }
            },
            text: 'Prev',
          ),

          // pages list view
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => PageNumberButton(
                index: index,
                isSelected: currentIndex == index,
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  homeProvider.getAllNews(
                    pageNumber: (currentIndex + 1).toString(),
                  );
                },
              ),
            ),
          ),

          // go to the next page
          PaginationButton(
            onPressed: () {
              if (currentIndex < 5) {
                setState(() {
                  currentIndex += 1;
                });
                homeProvider.getAllNews(
                  pageNumber: (currentIndex + 1).toString(),
                );
              }
            },
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
