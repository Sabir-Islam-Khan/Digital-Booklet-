import './Services/Auth.dart';
import './Services/LandingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DigitalBooklet());
}

// this part is self explainatory
class DigitalBooklet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // goes to landing page.. then user token decides which page to show
        body: LandingPage(
          auth: Auth(),
        ),
      ),
    );
  }
}