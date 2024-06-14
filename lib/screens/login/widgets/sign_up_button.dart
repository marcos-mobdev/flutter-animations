import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:160),
      child: TextButton(
          onPressed: (){},
          child: const Text(
            "Não possui uma conta? Cadastre-se",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          )
      ),
    );
  }
}
