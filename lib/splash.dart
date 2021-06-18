import 'dart:async';

import 'package:final_y3/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash(),
      routes: {'home': (context) => SCBottom()},
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void startTimer() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('home');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEFEBE9),
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        'Shop The Best \n Food \n In Nkozi',
                        style: GoogleFonts.bigShouldersText(
                            fontSize: 34,
                            height: 1.4,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                top: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset('assets/spal.json'))
            ],
          ),
        ),
      ),
    );
  }
}
