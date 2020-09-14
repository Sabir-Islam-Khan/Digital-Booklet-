import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:digital_booklet/Screens/AllProducts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String size;
  final String price;
  final String details;
  final String imgLinkOne;
  final String imgLinkTwo;
  final String imgLinkThree;
  final String imgLinkFour;

  // contructor of this class;

  DetailsPage({
    @required this.name,
    @required this.size,
    @required this.price,
    @required this.details,
    @required this.imgLinkOne,
    @required this.imgLinkTwo,
    @required this.imgLinkThree,
    @required this.imgLinkFour,
  });
  @override
  Widget build(BuildContext context) {
    // total heigh and width constains

    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: totalHeight * 0.4,
                    width: totalWidth * 1,
                    child: Carousel(
                      dotSize: 5.0,
                      animationDuration: Duration(seconds: 1),
                      images: [
                        NetworkImage(imgLinkOne),
                        NetworkImage(imgLinkTwo),
                        NetworkImage(imgLinkThree),
                        NetworkImage(imgLinkFour),
                      ],
                    ),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.0,
                            top: 5.0,
                          ),
                          child: Text(
                            "$name - $size",
                            style: GoogleFonts.meriendaOne(
                              color: Color.fromRGBO(237, 114, 47, 1),
                              fontSize: totalWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.0,
                            top: 2.0,
                          ),
                          child: Text(
                            "$price ৳",
                            style: GoogleFonts.meriendaOne(
                              color: Color.fromRGBO(255, 71, 33, 1),
                              fontSize: totalHeight * 0.023,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: totalWidth * 0.4,
                          ),
                          child: AutoSizeText(
                            "Details",
                            style: GoogleFonts.meriendaOne(
                              color: Color.fromRGBO(255, 71, 33, 1),
                              fontSize: totalWidth * 0.045,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            left: 7.0,
                          ),
                          child: Text(
                            details,
                            style: GoogleFonts.meriendaOne(),
                          ),
                        )
                      ],
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
