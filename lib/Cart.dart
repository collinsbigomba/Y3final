import 'package:final_y3/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

var scaffoldkey = GlobalKey<ScaffoldState>();

class _CartState extends State<Cart> {
  Future<Null> refreshList() async {
    await Future.delayed(Duration(
        seconds: 3)); // inorder for the refresh indicator to take 3 seconds
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      height: 100,
      color: Colors.orange[200],
      onRefresh: refreshList,
      child: SafeArea(
        child: Scrollbar(
          child: Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.keyboard_backspace),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              title: Text('Cart',
                  style: GoogleFonts.bigShouldersText(color: Colors.black)),
              actions: [
                IconButton(
                    color: Colors.green,
                    icon: FaIcon(FontAwesomeIcons.bell),
                    onPressed: () {
                      scaffoldkey.currentState.openEndDrawer();
                    }),
              ],
            ),
            endDrawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      'E-Agric Manager',
                      style: GoogleFonts.bigShouldersText(color: Colors.black),
                    ),
                    accountEmail: Text(
                      'collinsbigomba8@gmail.com',
                      style: GoogleFonts.bigShouldersText(color: Colors.black),
                    ),
                    decoration: BoxDecoration(color: Colors.white70),
                    currentAccountPicture: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage('assets/1.jpeg'),
                      ),
                    ),
                  ),
                  ListTile(
                    autofocus: true,
                    title: Text('Prices',style: GoogleFonts.bigShouldersText(),),
                    trailing: Icon(Icons.monetization_on),
                    onTap: () {},
                  ),
                  ListTile(
                    autofocus: true,
                    title: Text('Account',style: GoogleFonts.bigShouldersText(),),
                    trailing: Icon(Icons.account_balance),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    autofocus: true,
                    title: Text('Close',style: GoogleFonts.bigShouldersText(),),
                    trailing: Icon(Icons.cancel),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Material(
              elevation: 8,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        '\$${cartList.length > 0 ? cartList.map((e) => e.price * e.quantity).reduce((value, element) => value + element).toStringAsFixed(2) : 0}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bigShouldersText(fontSize: 15)),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Payments()));
                      },
                      child: Text(
                        'Pay',
                        style: GoogleFonts.bigShouldersText(
                          color: Colors.orange,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  //   BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(cartList[index].image),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartList[index].title,
                            style: GoogleFonts.bigShouldersText(fontSize: 15),
                          ),
                          Text(
                            cartList[index].desc,
                            style: GoogleFonts.bigShouldersText(
                                fontSize: 10, color: Colors.grey),
                          ),
                          Text("\$ ${cartList[index].price.toString()}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cartList[index].quantity > 0) {
                                        cartList[index].quantity--;
                                      }
                                    });
                                  }),
                              Container(
                                  width: 44,
                                  height: 44,
                                  color: Colors.white70,
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            cartList[index].quantity.toString(),
                                        hintStyle: GoogleFonts.bigShouldersText(
                                            color: Colors.black)),
                                  )),
                              IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cartList[index].quantity <= 8) {
                                        cartList[index].quantity++;
                                      }
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Payments',
            style: GoogleFonts.bigShouldersText(),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
