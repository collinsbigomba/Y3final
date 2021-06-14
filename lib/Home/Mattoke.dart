import 'package:final_y3/modals/colorpallette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';



class Mattoke extends StatefulWidget {
  //const Mattoke({ Key? key }) : super(key: key);

  @override
  _MattokeState createState() => _MattokeState();
}

class _MattokeState extends State<Mattoke> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItem('assets/maize2.jpg', '150', ColorPallette().thirdSlice),
        buildListItem('assets/potat1.jpg', '200', ColorPallette().forthSlice)
      ],
    );
  }
}
buildListItem(String imgPath, String price, Color bgColor) {
  return GestureDetector(
    onTap: () {},
    child: Stack(
      children: [
        Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent),
        ),
        Positioned(
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/q1.jpeg',
                    ),
                    fit: BoxFit.none)),
          ),
          top: 100,
        ),
        Positioned(
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          top: 100,
        ),
        Positioned(
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: bgColor.withOpacity(0.9),
            ),
          ),
          top: 100,
        ),
        Positioned(
          child: Hero(
            tag: imgPath,
            child: Container(
              height: 250,
              width: 150,
              child: Image(
                image: AssetImage(imgPath),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          right: 2,
        ),
        Positioned(
          top: 110,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D), fontSize: 20),
              ),
              Text(
                '\$' + price,
                style: GoogleFonts.bigShouldersText(
                    color: Colors.white, fontSize: 40),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Kato\'s Mattoke',
                style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D), fontSize: 27),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '72 reviews',
                          style: GoogleFonts.bigShouldersText(
                              color: Colors.white, fontSize: 15),
                        ),
                        SmoothStarRating(
                          starCount: 5,
                          size: 15,
                          color: Colors.white,
                          rating: 3,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(MattokeDetails(
                          imgPath: imgPath,
                          headerColor: bgColor,
                        ));
                      },
                      child: Container(
                        width: 75,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add',
                                style: GoogleFonts.bigShouldersText(
                                    color: Color(0xFF23163D), fontSize: 15),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class MattokeDetails extends StatefulWidget {
  //const RiceDetails({ Key? key }) : super(key: key);
  final imgPath, headerColor;

  const MattokeDetails({Key key, this.imgPath, this.headerColor})
      : super(key: key);

  @override
  _MattokeDetailsState createState() => _MattokeDetailsState();
}

class _MattokeDetailsState extends State<MattokeDetails> {
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
              width: screenWidth,
              color: ColorPallette().leftBarColor,
            ),
            Container(
              height: screenheight / 2,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
            ),
            Container(
              height: (screenheight / 4 + 25),
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/a8.jpeg'), fit: BoxFit.none)),
            ),
            Container(
              height: (screenheight / 4 + 25),
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Colors.white.withOpacity(0.6)),
            ),
            Container(
              height: (screenheight / 4 + 25),
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: widget.headerColor.withOpacity(0.9)),
            ),
            Positioned(
              top: 35,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ),
            Positioned(
                top: (screenheight / 4 - 100),
                left: screenWidth / 4,
                child: Hero(
                    tag: widget.imgPath,
                    child: Image(
                      image: AssetImage(
                        widget.imgPath,
                      ),
                      height: 175,
                      width: 175,
                      fit: BoxFit.cover,
                    ))),
            Positioned(
              top: (screenheight / 4) + 85,
              left: screenWidth / 7,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kato\'s Mattoke',
                      style: GoogleFonts.bigShouldersText(
                          color: Color(0xFF23163D), fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.verified_user),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '1.5k',
                          style: GoogleFonts.bigShouldersText(
                              color: ColorPallette().firstSlice, fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.star_border),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '4.0',
                          style: GoogleFonts.bigShouldersText(
                              color: ColorPallette().firstSlice, fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.anchor_sharp),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'No.1',
                          style: GoogleFonts.bigShouldersText(
                              color: ColorPallette().firstSlice, fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenheight / 2 + 10,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: GoogleFonts.bigShouldersText(
                        color: Color(0xFF23163D), fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth - 40,
                    child: Text(
                      ' Matoke, also known as Matooke or Ibitoke, is a meal consisting of steamed green banana and is one of the national dishes of Uganda. The medium-sized green fruits, which are of a specific group of banana, the East African Highland bananas, are locally known as matoke.',
                      style: GoogleFonts.bigShouldersText(
                          color: Color(0xFFB5ABB8), fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    width: screenWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildOneItem('\$65'),
                        SizedBox(
                          width: 20,
                        ),
                        buildOneItem('\$128'),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 225,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorPallette().buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            'BUY NOW ',
                            style: GoogleFonts.bigShouldersText(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ColorPallette().buttonColor,
                              width: 2,
                            )),
                        child: Center(
                          child: Icon(
                            Icons.bookmark,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

buildOneItem(String price) {
  return Stack(
    children: [
      Container(
        height: 125,
        width: 200,
        color: Colors.transparent,
      ),
      Positioned(
        top: 50,
        child: Container(
          height: 75,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
            ],
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        right: 5,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/b.jpeg'), fit: BoxFit.cover),
          ),
        ),
      ),
      Positioned(
        top: 60,
        left: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              price,
              style: GoogleFonts.bigShouldersText(
                  color: ColorPallette().firstSlice, fontSize: 25),
            ),
            Text(
              'KATOS KIT',
              style: GoogleFonts.bigShouldersText(
                  color: Color(0xFF23163D), fontSize: 20),
            ),
          ],
        ),
      )
    ],
  );
}

