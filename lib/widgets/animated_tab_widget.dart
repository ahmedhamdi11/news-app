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
          style: TextStyle(
            fontSize: isSelected ? 22.0 : 14.0,
            color: Provider.of<ThemeProvider>(context).isDarkTheme
                ? Colors.white
                : Colors.black,
          ),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
