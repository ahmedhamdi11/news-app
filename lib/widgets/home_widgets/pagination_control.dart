import 'package:flutter/material.dart';
import 'package:news_app/widgets/home_widgets/page_number_button.dart';
import 'package:news_app/widgets/home_widgets/pagination_button.dart';

class PaginationController extends StatefulWidget {
  const PaginationController({super.key});

  @override
  State<PaginationController> createState() => _PaginationControllerState();
}

class _PaginationControllerState extends State<PaginationController> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          // go to the previus page
          PaginationButton(
            onPressed: () {
              currentIndex > 0 ? currentIndex -= 1 : null;
              setState(() {});
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
                },
              ),
            ),
          ),

          // go to the next page
          PaginationButton(
            onPressed: () {
              currentIndex < 4 ? currentIndex += 1 : null;
              setState(() {});
            },
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
