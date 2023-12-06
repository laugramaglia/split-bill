import 'package:flutter/material.dart';
import 'package:split_bill/common/animation/custom_rec_tween.dart';

class HeroCardAnimation extends StatelessWidget {
  final Widget child;
  final String heroTag;
  final double width;
  final double height;
  const HeroCardAnimation(
      {required this.child,
      required this.heroTag,
      this.width = 300,
      this.height = 300,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      createRectTween: (begin, end) => CustomRectTween(begin: begin, end: end),
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            maxHeight: height,
            maxWidth: width,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}
