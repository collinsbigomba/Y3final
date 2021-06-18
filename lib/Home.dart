import 'package:final_y3/Home/Mattoke.dart';
import 'package:final_y3/modals/colorpallette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:lottie/lottie.dart';

import 'Home/Ginger.dart';
import 'Home/Peas.dart';
import 'Home/Rice.dart';
import 'Home/Vinegar.dart';

var bannerItems = ['Beans', 'Peas', 'Ginger', 'Mattoke', 'Potatoes'];
var bannerImage = [
  'assets/iages.jpeg',
  'assets/images.jpeg',
  'assets/1.jpeg',
  'assets/images1.jpeg',
  'assets/images2.jpeg',
];

class HiddenDrawer extends StatefulWidget {
  HiddenDrawer({Key key}) : super(key: key);

  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> items = [];

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Home",
          baseStyle: GoogleFonts.bigShouldersText(
              color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
          selectedStyle: null,
        ),
        Home()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Info",
          baseStyle: GoogleFonts.bigShouldersText(
              color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: null,
        ),
        Home2()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HiddenDrawerMenu(
        actionsAppBar: [
          IconButton(
              icon: Icon(Icons.keyboard_backspace),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
        backgroundColorMenu: Colors.blueGrey,
        backgroundColorAppBar: Colors.cyan,
        screens: items,
        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    disableAppBarDefault: false,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        slidePercent: 50,
        verticalScalePercent: 80.0,
        contentCornerRadius: 40.0,
        //    iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),

        //    backgroundColorContent: Colors.blue,
        elevationAppBar: 0,
        //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //    enableShadowItensMenu: true,
      ),
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final colorPallette = ColorPallette();
  var _selectedOption = 0;
  List allOptions = [
    Rice(),
    Mattoke(),
    Peas(),
    Ginger(),
    Vinegar(),
  ];

  List isSelected = [true, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: screenheight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          Container(
            height: screenheight,
            width: screenWidth / 5,
            color: colorPallette.leftBarColor,
          ),
          Positioned(
            child: Container(
              height: screenheight,
              width: screenWidth - (screenWidth / 5),
              color: Colors.white,
            ),
            left: screenWidth / 5,
          ),
          Positioned(
            child: Icon(Icons.shopping_bag),
            right: 20,
            top: 15,
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agric Products',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 40),
                ),
                Text(
                  'Alot can happen over here',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59F80), fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 225,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.4))),
                        contentPadding: EdgeInsets.only(top: 10, left: 10),
                        hintText: 'Search....',
                        hintStyle: GoogleFonts.bigShouldersText(
                          color: Color(0xFFA59FB0),
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.4),
                        )),
                  ),
                )
              ],
            ),
            //top: screenheight - (screenheight - 100),
            left: (screenWidth / 5) + 25,
            top: 60,
          ),
          buildSideNavigator(),
          Positioned(
            top: (screenheight / 4) + 5,
            left: (screenWidth / 5) + 25,
            child: Container(
              height: screenheight - ((screenheight / 3) + 50),
              width: screenWidth - ((screenWidth / 5) + 40),
              child: allOptions[_selectedOption],
            ),
          )
        ],
      )),
    );
  }

  buildSideNavigator() {
    return Positioned(
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.height - 100,
          height: MediaQuery.of(context).size.width / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOption('Rice', 0),
              buildOption('Matooke', 1),
              buildOption('Peas', 2),
              buildOption('Ginger', 3),
              buildOption('Vinegar', 4),
            ],
          ),
        ),
      ),
      top: 50,
    );
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF23163D)),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
              ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          child: Text(
            title,
            style: isSelected[index]
                ? GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D), fontSize: 18)
                : GoogleFonts.bigShouldersText(
                    color: Color(0xFFA59FB0), fontSize: 17),
          ),
          onTap: () {
            setState(() {
              _selectedOption = index;
              isOptionSelected(index);
            });
          },
        )
      ],
    );
  }

  void isOptionSelected(int index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: TextFormField(
                  controller: searchTextEditingController,
                  autocorrect: true,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Search..',
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.9),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.orange,
                      )),
                ),
              ),
            ),
            BannerWidgetArea(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Lottie.asset(
                'assets/plant.json'),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatefulWidget {
  @override
  _BannerWidgetAreaState createState() => _BannerWidgetAreaState();
}

class _BannerWidgetAreaState extends State<BannerWidgetArea> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = [];

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          //shadow behind pageview
                          color: Colors.black54,
                          offset: Offset(4, 4),
                          blurRadius: 5,
                          spreadRadius: 3)
                    ]),
              ),
              ClipRRect(
                child: Image.asset(
                  bannerImage[x],
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    //black  shadow on page
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[x],
                      style: GoogleFonts.bigShouldersText(
                          fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
      width: screenwidth,
      height: screenwidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
