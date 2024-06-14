import 'package:animacoes/screens/home/widgets/animated_list_view.dart';
import 'package:flutter/material.dart';

import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({required this.controller})
      : containerGrow = CurvedAnimation(
    parent: controller,
    curve: Curves.ease,
  ),
        listSlidePosition = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 0),
          end: const EdgeInsets.only(bottom: 80),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.325, 0.8, curve: Curves.ease),
          ),
        ),
        fadeAnimation = ColorTween(
          begin: Color.fromRGBO(247, 64, 106, 1),
          end: Color.fromRGBO(247, 64, 106, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.decelerate,
          ),
        );

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color?> fadeAnimation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
