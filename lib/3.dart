import 'package:final_y3/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Three extends StatefulWidget {
  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 1,
      initialPage: currentPage,
      keepPage: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Digital Market',
            style: GoogleFonts.bigShouldersText(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Our Products',
                        style: GoogleFonts.bigShouldersText(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Desired Discounts',
                        style: GoogleFonts.bigShouldersText(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    for (var i = 0; i < characters.length; i++)
                      Food(
                        character: characters[i],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Food extends StatelessWidget {
  // const Food({ Key? key }) : super(key: key);
  final Character character;

  const Food({Key key, this.character}) : super(key: key);

  // _Food(this.character);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => FoodDetailsScreen(
              character: character,
            ),
            transitionDuration: Duration(milliseconds: 360),
            // pageBuilder: (context) => CharactersDetailsScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: FoodCardBackgroundClipper(),
              child: Hero(
                tag: 'background-${character.name}',
                child: Container(
                  height: 0.55 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: character.colors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.3),
            child: Hero(
              tag: 'image-${character.name}',
              child: Image.asset(
                character.imgPath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'name-${character.name}',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        character.name,
                        style: GoogleFonts.bigShouldersText(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Tap to see details',
                  style: GoogleFonts.bigShouldersText(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
/*class FoodCharacters extends StatefulWidget {
  // const FoodCharacters({ Key? key }) : super(key: key);

  @override
  _FoodCharactersState createState() => _FoodCharactersState();
}

class _FoodCharactersState extends State<FoodCharacters> {
  final Character character;

  _FoodCharactersState(this.character);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => FoodDetailsScreen(
              character: characters[0],
            ),
            transitionDuration: Duration(milliseconds: 360),
            // pageBuilder: (context) => CharactersDetailsScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: FoodCardBackgroundClipper(),
              child: Hero(
                tag: 'background-${character.name}',
                child: Container(
                  height: 0.55 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: characters[0].colors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.3),
            child: Hero(
              tag: 'image-${character.name}',
              child: Image.asset(
                characters[0].imgPath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'name-${character.name}',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        characters[0].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Tap to see details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}*/

class FoodCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);

    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height + 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}

class FoodDetailsScreen extends StatefulWidget {
  //const CharactersDetailsScreen({ Key? key }) : super(key: key);
  final Character character;

  const FoodDetailsScreen({Key key, this.character}) : super(key: key);
  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'backgound-${widget.character.name}',
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget.character.colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: 'image-${widget.character.name}',
                      child: Image.asset(
                        widget.character.imgPath,
                        height: screenHeight * 0.45,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Hero(
                      tag: 'name-${widget.character.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            widget.character.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 8, 15),
                    child: Text(
                      widget.character.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            /*AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      height: 80,
                      child: Text(
                        'Clips',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: clipWidget(),
                    )
                  ],
                ),
              ),
              bottom: 0,
              left: 0,
              right: 0,
            ),*/
          ],
        ),
      ),
    );
  }

  Widget clipWidget() {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Column(
            children: [
              roundedContainer(Colors.redAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.greenAccent),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: [
              roundedContainer(Colors.grey[400]),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.blueGrey[200]),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: [
              roundedContainer(Colors.orangeAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.orange[200]),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: [
              roundedContainer(Colors.lightGreenAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.greenAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
      width: 100,
      height: 100,
    );
  }
}
