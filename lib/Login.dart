import 'package:final_y3/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash.dart';

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Login(),
      routes: {'home': (context) => Splash()},
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: GoogleFonts.bigShouldersText(),
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'collinsbigomba8@gmail.com',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  maxLength: 30,
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Email is required";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: GoogleFonts.bigShouldersText(),
                  autocorrect: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phonelink_lock),
                    labelText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  obscureText: true,
                  maxLength: 15,
                  validator: (input) {
                    if (input.isEmpty) {
                      return "password is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      autofocus: true,
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Splash()));
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.bigShouldersText(),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.bigShouldersText(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
