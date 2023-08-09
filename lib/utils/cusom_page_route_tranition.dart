import 'package:flutter/material.dart';

class CustomPageRouteTransition extends PageRouteBuilder {
  final Widget page;
  final TransitionTypeEnum transitionType;
  final Duration duration;
  CustomPageRouteTransition({
    required this.page,
    this.transitionType = TransitionTypeEnum.rtlWithFade,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          transitionDuration: duration,
          pageBuilder: (context, animation, secondAnimation) => page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            switch (transitionType) {
              case TransitionTypeEnum.fade:
                final fadeAnimation =
                    Tween<double>(begin: 0, end: 1).animate(animation);
                return FadeTransition(
                  opacity: fadeAnimation,
                  child: child,
                );

              case TransitionTypeEnum.rtl:
                const begin = Offset(1, 0);
                const end = Offset.zero;
                final slidAnimation =
                    Tween<Offset>(begin: begin, end: end).animate(animation);
                return SlideTransition(
                  position: slidAnimation,
                  child: child,
                );

              case TransitionTypeEnum.rtlWithFade:
                const begin = Offset(1, 0);
                const end = Offset.zero;
                final slidAnimation =
                    Tween<Offset>(begin: begin, end: end).animate(animation);
                final fadeAnimation =
                    Tween<double>(begin: 0, end: 1).animate(animation);
                return FadeTransition(
                  opacity: fadeAnimation,
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
  rtl,
  rtlWithFade,
}
