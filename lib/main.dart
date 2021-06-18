import 'package:final_y3/3.dart';
import 'package:final_y3/Account.dart';
import 'package:final_y3/Home.dart';
import 'package:final_y3/Login.dart';
import 'package:final_y3/Categories.dart';
import 'package:final_y3/Cart.dart';
import 'package:final_y3/modals/scbdata.dart';
import 'package:final_y3/one.dart';
import 'package:final_y3/two.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  // keep track of active tab
  // int _activeTab = 0;
  // page switch
  /*  List<Widget> pages = [
    FoodListing(),
    SizedBox(),
    FoodListing(),
  ];*/
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
                SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop',
                            style: GoogleFonts.bigShouldersText(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          /*Container(
                          margin: EdgeInsets.only(top: 24),
                          height: 60,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              // must create a modalfor this page with data inside
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _activeTab = index;
                                    });
                                  },
                                  // switch animation
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 450),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: _activeTab == index
                                          ? Colors.grey
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        StaticData.categories[index].name,
                                        style: GoogleFonts.bigShouldersText(
                                          fontWeight: FontWeight.bold,
                                          color: _activeTab == index
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 35,
                                );
                              },
                              itemCount: StaticData.categories.length),
                        ),*/
                          SizedBox(
                            height: 20,
                          ),
                          // page switch
                          FoodListing(),
                          /* AnimatedSwitcher(
                          duration: Duration(milliseconds: 450),
                          child: pages[_activeTab],
                        ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SCBottomBarDetails(
            bnbHeight: 60,
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: Colors.orange),
            titleStyle: GoogleFonts.bigShouldersText(
                color: Colors.black45, fontSize: 12),
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

class FoodListing extends StatelessWidget {
  //const FoodListing({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // must create a food modal and populate it with data
        itemCount: StaticData.foods.length,
        crossAxisCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SingleProduct()));*/
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.white, offset: Offset(0, 2), blurRadius: 4)
                ]),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: StaticData.foods[index].image,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StaticData.foods[index].name,
                            style: GoogleFonts.bigShouldersText(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            StaticData.foods[index].description,
                            style: GoogleFonts.bigShouldersText(
                                fontSize: 13, color: Colors.grey),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${StaticData.foods[index].price.toStringAsFixed(2)}',
                                  style: GoogleFonts.bigShouldersText(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.add,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(2, 3),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  //const SingleProduct({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 300,
                width: double.infinity,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    //  image: DecorationImage(
                    //image: StaticData.foods[index].image,
                    //),
                    ),
              ),
              top: 0,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
