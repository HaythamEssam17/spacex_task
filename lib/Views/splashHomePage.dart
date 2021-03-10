import 'dart:async';

import 'package:flutter/material.dart';

import 'bottomNavBarPage.dart';

class SplashHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashHomePageState();
}

class SplashHomePageState extends State<SplashHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  goToNextPage(BuildContext context) async {
    return Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => BottomNavBarPage()));
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
    goToNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Center(
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Center(
              child: Image.asset('images/logo.png',
                  fit: BoxFit.fill,
                  height: size.height * 0.35,
                  width: size.height * 0.35),
            ),
          ),
        ),
      ),
    );
  }
}
