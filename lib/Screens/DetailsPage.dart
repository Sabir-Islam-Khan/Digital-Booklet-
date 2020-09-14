import 'package:digital_booklet/Screens/AllProducts.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllProducts(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(175, 120, 252, 1),
                  Color.fromRGBO(154, 175, 253, 1),
                ],
              ),
            ),
          ),
          title: Center(
            child: Text("Details"),
          ),
        ),
      ),
    );
  }
}
