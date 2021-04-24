import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/shared/route_animations/route_animations.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000)).then((_) =>
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            RouteAnimations(route: HomePage(), duration: 1000)
                .opacityTransition(0.3),
            (Route<dynamic> route) => false));

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
