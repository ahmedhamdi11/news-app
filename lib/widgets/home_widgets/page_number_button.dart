import 'package:flutter/material.dart';

class PageNumberButton extends StatelessWidget {
  const PageNumberButton({
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
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 38.0,
          height: 38.0,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                width: 38.0,
                height: isSelected ? 38.0 : 0,
                bottom: 0,
                duration: const Duration(milliseconds: 250),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: isSelected ? Colors.white : null),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
