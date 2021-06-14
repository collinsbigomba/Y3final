import 'package:final_y3/3.dart';
import 'package:final_y3/Account.dart';
import 'package:final_y3/Home.dart';
import 'package:final_y3/Login.dart';
import 'package:final_y3/Categories.dart';
import 'package:final_y3/Cart.dart';
import 'package:final_y3/one.dart';
import 'package:final_y3/two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {'home': (context) => SCBottom()},
    );
  }
}

class SCBottom extends StatefulWidget {
  SCBottom({Key key}) : super(key: key);

  @override
  _SCBottomState createState() => _SCBottomState();
}

class _SCBottomState extends State<SCBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinCircleBottomBarHolder(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Stack(
              children: [
                
               /* ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 160,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Wrap(
                          children: [
                            Image.asset('assets/1.jpeg'),
                            ListTile(
                              title: Text('heading 1'),
                              subtitle: Text('sub'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 160,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Wrap(
                          children: [
                            Image.asset('assets/1.jpeg'),
                            ListTile(
                              title: Text('heading 1'),
                              subtitle: Text('sub'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 160,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Wrap(
                          children: [
                            Image.asset('assets/1.jpeg'),
                            ListTile(
                              title: Text('heading 1'),
                              subtitle: Text('sub'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 160,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Wrap(
                          children: [
                            Image.asset('assets/1.jpeg'),
                            ListTile(
                              title: Text('heading 1'),
                              subtitle: Text('sub'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 160,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Wrap(
                          children: [
                            Image.asset('assets/1.jpeg'),
                            ListTile(
                              title: Text('heading 1'),
                              subtitle: Text('sub'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    
                  ],
                ),*/
              
              ],
            ),
          ),
        ),
        bottomNavigationBar: SCBottomBarDetails(
            bnbHeight: 60,
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: Colors.orange),
            titleStyle: GoogleFonts.bigShouldersText(color: Colors.black45, fontSize: 12),
            activeTitleStyle: GoogleFonts.bigShouldersText(
                color: Colors.orange,
                fontSize: 12,
                fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
                color: Colors.orange,
                icon: Icon(Icons.expand_less),
                elevation: 0),
            items: <SCBottomBarItem>[
              SCBottomBarItem(
                  icon: Icons.home,
                  title: "Home",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HiddenDrawer()));
                  }),
              SCBottomBarItem(
                  icon: Icons.people,
                  title: "Categories",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Categoriess()));
                  }),
              SCBottomBarItem(
                  icon: Icons.shopping_cart_outlined,
                  title: "Cart",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  }),
              SCBottomBarItem(
                  icon: Icons.account_circle_outlined,
                  title: "Account",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Account()));
                  }),
            ],
            circleItems: <SCItem>[
              SCItem(
                  icon: Icon(Icons.accessibility_new),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => One()));
                  }),
              SCItem(
                  icon: Icon(Icons.online_prediction),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Two()));
                  }),
              SCItem(
                  icon: Icon(Icons.emoji_food_beverage),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Three()));
                  }),
            ]),
      ),
    );
  }
}
