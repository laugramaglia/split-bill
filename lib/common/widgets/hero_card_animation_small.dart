import 'package:flutter/material.dart';
import 'package:split_bill/common/animation/hero_dialog_route.dart';
import 'package:split_bill/common/widgets/hero_card_animation.dart';
import 'package:split_bill/common/widgets/hero_card_animation_big.dart';

class SmallCardHeroAnimation extends StatelessWidget {
  final Widget childSmall, childBig;
  final String heroTag;

  const SmallCardHeroAnimation(
      {required this.childSmall,
      required this.childBig,
      required this.heroTag,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return HeroCardAnimationBig(
                width: 400,
                height: MediaQuery.of(context).size.height - 100,
                heroTag: heroTag,
                child: childBig,
              );
            }));
          },
          child: HeroCardAnimation(
            heroTag: heroTag,
            child: childSmall,
          )),
    );
  }
}
