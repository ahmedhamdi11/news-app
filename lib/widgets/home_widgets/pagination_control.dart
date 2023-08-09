import 'package:flutter/material.dart';

class PaginationControl extends StatefulWidget {
  const PaginationControl({super.key});

  @override
  State<PaginationControl> createState() => _PaginationControlState();
}

class _PaginationControlState extends State<PaginationControl> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PaginationButton(
            onPressed: () {
              currentIndex > 0 ? currentIndex -= 1 : null;
              setState(() {});
            },
            text: 'Prev',
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => PageNumbersButton(
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

/////////
class PageNumbersButton extends StatelessWidget {
  const PageNumbersButton({
    super.key,
    required this.index,
    required this.isSelected,
    this.onTap,
  });
  final int index;
  final bool isSelected;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(4.0)),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(color: isSelected ? Colors.white : null),
            ),
          ),
        ),
      ),
    );
  }
}

///////////
class PaginationButton extends StatelessWidget {
  const PaginationButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62.0,
      child: MaterialButton(
        color: Colors.blue,
        elevation: 0.0,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
