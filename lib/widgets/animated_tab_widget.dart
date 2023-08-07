import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomAnimatedTab extends StatelessWidget {
  const CustomAnimatedTab({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelected,
  });
  final String text;
  final Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).cardColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: isSelected ? 20.0 : 14.0,
                fontWeight: FontWeight.w500,
              ),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
