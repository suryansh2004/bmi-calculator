import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, "/"),
    );
    return const Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(
            text: "Developed",
            style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            children: [
              TextSpan(
                  text: " by",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                  )),
              TextSpan(
                  text: "\nSuryansh",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blue,
                  ))
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
