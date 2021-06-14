import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash.dart';

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Signup(),
      routes: {'home': (context) => Splash()},
    );
  }
}
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                    }),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Splash()));
                  },
                  child: Text("Sign up",style: GoogleFonts.bigShouldersText()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
