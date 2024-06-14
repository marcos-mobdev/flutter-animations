import 'package:animacoes/screens/home/home_screen.dart';
import 'package:animacoes/screens/login/widgets/form_container.dart';
import 'package:animacoes/screens/login/widgets/sign_up_button.dart';
import 'package:animacoes/screens/login/widgets/stagger_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>HomeScreen())
        );
      }
    });
  }


  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1; //aumentar para diminuir velocidade de reprodução do app, para testes
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 70, bottom: 32),
                        child: Image.asset("images/tickicon.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain ,
                        )
                    ),
                    FormContainer(),
                    SignUpButton()
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
