import 'dart:async';

import 'package:final_y3/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Container(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: -70,
                child: Image.asset('assets/1.jpeg'),
              ),
              Positioned(
                left: -70,
                bottom: 0,
                child: Image.asset('assets/1.jpeg'),
              ),
              Positioned(
                child: Image.asset(
                  'assets/1.jpeg',
                  width: 250,
                ),
                right: -70,
                bottom: -10,
              ),
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
                height: 8,
              ),
              Text('Experience the best taste  of our quality food products '),
              SizedBox(
                height: 20,
              ),
              Container(
                child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
