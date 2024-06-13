// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:map2/app/domain/ui/pages/welcome/welcome_page.dart';

class SplashPage extends StatefulWidget {
  static String route = '';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              padding: const EdgeInsets.all(35.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Image.asset(
                  'assets/images/logofinal.png',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
