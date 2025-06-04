import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height: double.infinity,
            // width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF939B), Color(0xFFEF2A39)],
              ),
            ),
          ),

          Center(
            child: Text(
              "Suruchi",
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 60,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 100,
            left: 20,
            child: Image.asset("assets/images/samosa.png"),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: Image.asset("assets/images/samosa.png"),
          ),
        ],
      ),
    );
  }
}
