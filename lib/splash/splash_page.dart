import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
