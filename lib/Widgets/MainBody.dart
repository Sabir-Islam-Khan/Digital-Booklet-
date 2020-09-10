import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mainBody(double totalHeight, double totalWidth) {
  return Container(
    height: totalHeight * 1,
    width: totalWidth * 1,
    color: Colors.grey[200],
    child: Column(
      children: [
        SizedBox(
          height: totalHeight * 0.01,
        ),

        // section for all products card
        Center(
          child: Card(
            elevation: 7.0,
            child: Container(
              height: totalHeight * 0.15,
              width: totalWidth * 0.95,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(175, 120, 252, 1),
                    Color.fromRGBO(154, 175, 253, 1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "All Products",
                      style: GoogleFonts.bebasNeue(
                        fontSize: totalHeight * 0.036,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: totalWidth * 0.04,
                  ),
                  Center(
                    child: Image(
                      height: totalHeight * 0.1,
                      width: totalWidth * 0.1,
                      image: AssetImage(
                        "assets/images/product.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(
          height: totalHeight * 0.01,
        ),

        // section for promo deals
        Center(
          child: Card(
            elevation: 7.0,
            child: Container(
              height: totalHeight * 0.15,
              width: totalWidth * 0.95,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(175, 120, 252, 1),
                    Color.fromRGBO(154, 175, 253, 1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Promo Deals",
                      style: GoogleFonts.bebasNeue(
                        fontSize: totalHeight * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: totalWidth * 0.04,
                  ),
                  Center(
                    child: Image(
                      height: totalHeight * 0.1,
                      width: totalWidth * 0.1,
                      image: AssetImage(
                        "assets/images/promo.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: totalHeight * 0.01,
        ),

        // section for notice board
        Center(
          child: Card(
            elevation: 7.0,
            child: Container(
              height: totalHeight * 0.15,
              width: totalWidth * 0.95,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(175, 120, 252, 1),
                    Color.fromRGBO(154, 175, 253, 1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Notice Board",
                      style: GoogleFonts.bebasNeue(
                        fontSize: totalHeight * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: totalWidth * 0.04,
                  ),
                  Center(
                    child: Image(
                      height: totalHeight * 0.1,
                      width: totalWidth * 0.1,
                      image: AssetImage(
                        "assets/images/notice.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(
          height: totalHeight * 0.01,
        ),

        // section for photo gallery
        Center(
          child: Card(
            elevation: 7.0,
            child: Container(
              height: totalHeight * 0.15,
              width: totalWidth * 0.95,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(175, 120, 252, 1),
                    Color.fromRGBO(154, 175, 253, 1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Photo gallery",
                      style: GoogleFonts.bebasNeue(
                        fontSize: totalHeight * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: totalWidth * 0.04,
                  ),
                  Center(
                    child: Image(
                      height: totalHeight * 0.1,
                      width: totalWidth * 0.1,
                      image: AssetImage(
                        "assets/images/gallery.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: totalHeight * 0.01,
        ),
        // section for user setting
        Center(
          child: Card(
            elevation: 7.0,
            child: Container(
              height: totalHeight * 0.15,
              width: totalWidth * 0.95,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(175, 120, 252, 1),
                    Color.fromRGBO(154, 175, 253, 1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "User Profile",
                      style: GoogleFonts.bebasNeue(
                        fontSize: totalHeight * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: totalWidth * 0.04,
                  ),
                  Center(
                    child: Image(
                      height: totalHeight * 0.1,
                      width: totalWidth * 0.1,
                      image: AssetImage(
                        "assets/images/ceo.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
