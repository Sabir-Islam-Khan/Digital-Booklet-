import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_booklet/Services/Auth.dart';
import 'package:digital_booklet/Widgets/MainBody.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Auth auth;
  HomePage({@required this.auth});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initSetup() async {
    setState(() {
      loading = true;
    });
    User user = await widget.auth.currentUser();

    setState(() {
      _user = user;
    });
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  User _user;
  bool loading;
  @override
  Widget build(BuildContext context) {
    // total height and width constrains
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
            child: Text("Dash Board"),
          ),
        ),
        body: SingleChildScrollView(
          child: loading == true
              ? Container(
                  height: totalHeight * 1,
                  width: totalWidth * 1,
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder(
                  stream: Firestore.instance
                      .collection('Users')
                      .document(_user.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: totalHeight * 1,
                        width: totalWidth * 1,
                        child: snapshot.data['isApproved'] == true
                            ? mainBody(totalHeight, totalWidth)
                            : Center(
                                child: Text(
                                  "Waiting for admin approval",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                      );
                    }

                    return Container(
                      height: totalHeight * 1,
                      width: totalWidth * 1,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
