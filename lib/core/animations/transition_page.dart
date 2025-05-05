import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTransitionPageGo<T> extends CustomTransitionPage<T> {
  Widget pageScreen;
  CustomTransitionPageGo({required this.pageScreen})
    : super(
        child: pageScreen,
        transitionDuration: const Duration(milliseconds: 150),
        reverseTransitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final isReverse = animation.status == AnimationStatus.reverse;
          final begin = isReverse ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.fastOutSlowIn));

          return SlideTransition(position: animation.drive(tween), child: child);
        },
      );
}
