import 'package:flutter/cupertino.dart';
import 'package:split_bill/common/widgets/hero_card_animation.dart';

class HeroCardAnimationBig extends StatelessWidget {
  final String heroTag;
  final Widget child;
  final double width;
  final double height;

  const HeroCardAnimationBig(
      {required this.child,
      required this.heroTag,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HeroCardAnimation(
          heroTag: heroTag, height: height, width: width, child: child),
    );
  }
}
