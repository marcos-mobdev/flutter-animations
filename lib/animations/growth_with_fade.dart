import 'package:flutter/material.dart';

class GrowFadeTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;
  final sizeTween = Tween<double>(begin: 0, end: 300);
  final opacityTween = Tween<double>(begin: 0.1, end: 1);

  GrowFadeTransition({required this.child, required this.animation});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context,child){
          return Opacity(
            opacity: opacityTween.evaluate(animation).clamp(0, 1.0),
            child: SizedBox(
              height: sizeTween.evaluate(animation),
              width: sizeTween.evaluate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}

