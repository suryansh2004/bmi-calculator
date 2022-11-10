import "package:flutter/material.dart";
import 'package:learning_flutter/screens/splash.dart';
import 'screens/screen.dart';

void main() => runApp(const BMIapp());

class BMIapp extends StatelessWidget {
  const BMIapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) {
          return const SplashScreen();
        },
      },
      home: const Home(),
    );
  }
}
