import 'package:flutter/material.dart';
import '../Screens/HomePage.dart';
import '../Screens/Signin.dart';
import '../Services/Auth.dart';

class LandingPage extends StatefulWidget {
  final Auth auth;
  LandingPage({@required this.auth});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: widget.auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;

          if (user == null) {
            return SignIn(
              auth: widget.auth,
            );
          }
          return HomePage(
            auth: widget.auth,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
