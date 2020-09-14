import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_booklet/Screens/DetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  //card for searched state

  Widget buildItem(DocumentSnapshot a, BuildContext ctx, double totalHeight,
      double totalWidth) {
    return Card(
      elevation: 5.0,
      child: Container(
        color: Color.fromRGBO(154, 175, 253, 1),
        height: totalHeight * 0.08,
        width: totalWidth * 0.97,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  name: a.data["name"],
                  size: a.data["size"],
                  price: a.data["price"],
                  details: a.data["details"],
                  imgLinkOne: a.data["imgLinkOne"],
                  imgLinkTwo: a.data["imgLinkTwo"],
                  imgLinkThree: a.data["imgLinkThree"],
                  imgLinkFour: a.data["imgLinkFour"],
                ),
              ),
            );
          },
          child: Center(
            child: Text(
              a.data["name"],
              style: GoogleFonts.meriendaOne(
                fontSize: totalHeight * 0.025,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String searchText = "";
  @override
  Widget build(BuildContext context) {
    // total height and width constrains
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
            child: Text("All Products"),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(175, 120, 252, 1),
                Color.fromRGBO(154, 175, 253, 1),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(),
                    width: totalWidth * 0.9,
                    height: totalHeight * 0.08,
                    child: TextField(
                      onChanged: (text) {
                        text = text.toUpperCase();

                        setState(() {
                          searchText = text;
                        });
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          labelText: "Search",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Search product name",
                          hintStyle: TextStyle(
                            color: Colors.grey[200],
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                searchText == ""
                    ? StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection("Products")
                            .orderBy("name")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              width: totalWidth * 1,
                              height: totalHeight * 0.8,
                              child: ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 5.0,
                                    child: Container(
                                      color: Color.fromRGBO(154, 175, 253, 1),
                                      height: totalHeight * 0.08,
                                      width: totalWidth * 0.97,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                name: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["name"],
                                                size: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["size"],
                                                price: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["price"],
                                                details: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["details"],
                                                imgLinkOne: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["imgLinkOne"],
                                                imgLinkTwo: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["imgLinkTwo"],
                                                imgLinkThree: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["imgLinkThree"],
                                                imgLinkFour: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["imgLinkFour"],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            snapshot.data.documents[index]
                                                .data["name"],
                                            style: GoogleFonts.meriendaOne(
                                              fontSize: totalHeight * 0.025,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                    : StreamBuilder(
                        stream: Firestore.instance
                            .collection("Products")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final results = snapshot.data.documents.where(
                                (DocumentSnapshot a) =>
                                    a.data['name']
                                        .toString()
                                        .contains(searchText) ||
                                    a.data['name']
                                        .toString()
                                        .toUpperCase()
                                        .contains(searchText));
                            return Container(
                              height: totalHeight * 1,
                              width: totalWidth * 1,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: results
                                      .map<Widget>((doc) => buildItem(
                                            doc,
                                            context,
                                            totalHeight,
                                            totalWidth,
                                          ))
                                      .toList(),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              height: totalHeight * 1,
                              width: totalWidth * 1,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
