import 'package:flutter/material.dart';

class CustomAnimatedloading extends StatefulWidget {
  const CustomAnimatedloading({super.key, required this.child});
  final Widget child;
  @override
  State<CustomAnimatedloading> createState() => _CustomAnimatedloadingState();
}

class _CustomAnimatedloadingState extends State<CustomAnimatedloading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _animation = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
