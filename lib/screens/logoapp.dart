import 'package:animacoes/animations/growth_with_fade.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {

  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut)
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          controller.reverse();
        }else if(status == AnimationStatus.dismissed){
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GrowFadeTransition(
        animation: animation,
        child: LogoWidget(),
      ),
    );
  }

}

/*class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo(Animation<double> animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: SizedBox(
            height: animation.value,
            width: animation.value,
            child: const FlutterLogo()
        )
    );
  }

}*/

class LogoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;

  GrowTransition({required this.child, required this.animation});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context,child){
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

