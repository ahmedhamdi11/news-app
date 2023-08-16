import 'package:flutter/material.dart';

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
