import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map2/app/domain/ui/pages/login_page.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';

class Bienvenida2 extends StatefulWidget {
  const Bienvenida2({Key? key}) : super(key: key);

  @override
  State<Bienvenida2> createState() => _Bienvenida2State();
}

class _Bienvenida2State extends State<Bienvenida2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoAnimation;
  late Animation<double> _logoRotationAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    initAnimator();
    autoRedirectToLoginScreen();
  }

  void initAnimator() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2, milliseconds: 500),
    );
    _logoRotationAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.5, curve: Curves.easeOut),
    );
    _logoAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1, curve: Curves.easeOut),
    );
    _textAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.65, 1, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  void autoRedirectToLoginScreen() {
    Future.delayed(
      const Duration(seconds: 3, milliseconds: 500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/fondoapp.jpg',
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Opacity(
                          opacity: _textAnimation.value,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-0.3, 0.0),
                              end: const Offset(0.25, 0.0),
                            ).animate(_textAnimation),
                            child: Text(
                              'PichangasYa',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 38,
                                    fontFamily: 'Roboto Condensed',
                                  ),
                            ),
                          ),
                        ),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.3, 0.0),
                            end: const Offset(-0.59, 0.0),
                          ).animate(_logoAnimation),
                          child: Transform(
                            transform: Matrix4.identity()
                              ..rotateY(_logoRotationAnimation.value * 6), //pi
                            alignment: Alignment.center,
                            child: Container(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              child: Image.asset(
                                'assets/images/logofinal.png',
                                width: 120.0,
                                height: 120.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
