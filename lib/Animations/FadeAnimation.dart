import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

/// properties for animation
enum _AniProps { opacity, translateX }

// main class
class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  // two constructor for animation controlling
  FadeIn(this.delay, this.child);

  // this part is hard to explain.. So leaving it without comments

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, 200.0.tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (300 * delay).round().milliseconds,
      duration: 500.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}
