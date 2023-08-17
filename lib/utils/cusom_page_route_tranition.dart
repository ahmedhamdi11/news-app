import 'package:flutter/material.dart';

class CustomPageRouteTransition extends PageRouteBuilder {
  final Widget page;
  final TransitionTypeEnum transitionType;
  final Duration duration;
  final Duration reverseDuratin;
  CustomPageRouteTransition({
    required this.page,
    this.transitionType = TransitionTypeEnum.rtlWithFade,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuratin = const Duration(milliseconds: 300),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuratin,
          pageBuilder: (context, animation, secondAnimation) => page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            switch (transitionType) {
              case TransitionTypeEnum.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );

              case TransitionTypeEnum.rtlWithFade:
                const begin = Offset(1, 0);
                const end = Offset.zero;
                final slidAnimation =
                    Tween<Offset>(begin: begin, end: end).animate(animation);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: slidAnimation,
                    child: child,
                  ),
                );
            }
          },
        );
}

enum TransitionTypeEnum {
  fade,
  rtlWithFade,
}
