import '../Animations/FadeAnimation.dart';
import '../Screens/Signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Services/Auth.dart';
import '../Services/LandingPage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateAccount extends StatefulWidget {
  // auth class to manage state without provider
  final AuthBase auth;

  CreateAccount({@required this.auth});
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // value controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final designationController = TextEditingController();
  // bool variable to check loading state
  bool isLoading = false;

  // method to push user data in firebase
  void createData(
      String name, String email, String number, String designation) async {
    Auth _auth = Auth();

    User _user = await _auth.currentUser();

    await Firestore.instance.collection('Users').document(_user.uid).setData(
      {
        'name': name,
        'email': email,
        'number': number,
        'designation': designation,
        'isApproved': false,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // toal height and width contrans
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        // appbar

        // main body
        // checking loading status
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  height: totalHeight * 1,
                  width: totalWidth * 1,
                  decoration: BoxDecoration(
                    // gradient colour for whole body
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(175, 120, 252, 1),
                        Color.fromRGBO(154, 175, 253, 1),
                        Color.fromRGBO(175, 120, 252, 1),
                      ],
                    ),
                  ),

                  // column to contain all other stuffs
                  // You can use stack later on to show bg image
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: totalHeight * 0.15,
                      ),
                      // using Fade Animation class for effect
                      FadeIn(
                        0.5,
                        Padding(
                          padding: EdgeInsets.only(
                            left: totalWidth * 0.06,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,

                            // title text
                            child: Text(
                              "Join Us !",
                              style: GoogleFonts.meriendaOne(
                                color: Colors.white,
                                fontSize: totalHeight * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeIn(
                        0.9,
                        Padding(
                          padding: EdgeInsets.only(
                            left: totalWidth * 0.08,
                            bottom: totalHeight * 0.03,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,

                            // subtitle text
                            child: Text(
                              "Join our community now !",
                              style: GoogleFonts.meriendaOne(
                                color: Colors.grey[200],
                                fontSize: totalHeight * 0.023,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // textfield for name
                      FadeIn(
                        1.3,
                        Container(
                          width: totalWidth * 0.9,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Enter your name",
                              hintStyle: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            controller: nameController,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: totalHeight * 0.01,
                      ),

                      // text field for number
                      FadeIn(
                        1.7,
                        Container(
                          width: totalWidth * 0.9,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Give your phone number ",
                              hintStyle: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            controller: numberController,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: totalHeight * 0.01,
                      ),

                      // text field for designation
                      FadeIn(
                        2.1,
                        Container(
                          width: totalWidth * 0.9,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              labelText: 'Designation',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Your designation in company",
                              hintStyle: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            controller: designationController,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: totalHeight * 0.01,
                      ),
                      // textfiled for email
                      FadeIn(
                        2.4,
                        Container(
                          width: totalWidth * 0.9,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                        ),
                      ),

                      // textfield for password
                      FadeIn(
                        2.7,
                        Container(
                          width: totalWidth * 0.9,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Minuimum 6 digit password",
                              hintStyle: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            controller: passwordController,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: totalHeight * 0.05,
                      ),
                      Center(
                        // sign up button
                        child: GestureDetector(
                          onTap: () async {
                            // lifting state up to show loading screen
                            setState(() {
                              isLoading = true;
                            });
                            print("Sign up button tapped !");
                            String mail = emailController.value.text;
                            String password = passwordController.value.text;

                            // calling method from auth class to register user
                            try {
                              dynamic result = await widget.auth
                                  .createAccountWithEmail(mail, password);
                              if (result == null) {
                                setState(() {
                                  isLoading = false;
                                });
                                // alert if info is invalid
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error !!",
                                  desc: "Info invalid. Check credentials !",
                                  buttons: [
                                    DialogButton(
                                      color: Color.fromRGBO(159, 122, 81, 1),
                                      child: Text(
                                        "Okay",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              } else {
                                // creates initial data on db when successful

                                // goes to landing page after succesful
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    // here landing page takes user to homepage
                                    builder: (context) => LandingPage(
                                      auth: widget.auth,
                                    ),
                                  ),
                                );
                                createData(
                                  nameController.value.text,
                                  emailController.value.text,
                                  numberController.value.text,
                                  designationController.value.text,
                                );
                              }
                            } catch (e) {
                              // this section will show if user dont have net connection
                              setState(() {
                                isLoading = false;
                              });
                              print(e);
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Error !!",
                                desc: "Info invalid. Check credentials !",
                                buttons: [
                                  DialogButton(
                                    color: Color.fromRGBO(159, 122, 81, 1),
                                    child: Text(
                                      "Okay",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ],
                              ).show();
                            }

                            // clearing textControllers outside all conditional logics
                            // its important to clear them outside
                            emailController.clear();
                            passwordController.clear();
                            nameController.clear();
                          },

                          // main button

                          child: FadeIn(
                            3.0,
                            Container(
                              // container for the button
                              height: totalHeight * 0.07,
                              width: totalWidth * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: Center(
                                // button text
                                child: Text(
                                  "Sign up",
                                  style: GoogleFonts.meriendaOne(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: totalHeight * 0.04,
                      ),

                      // bottom section
                      Row(
                        children: [
                          SizedBox(
                            width: totalWidth * 0.2,
                          ),
                          FadeIn(
                            3.3,
                            Text(
                              "Already have an account ?  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: totalWidth * 0.04,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(
                                    auth: widget.auth,
                                  ),
                                ),
                              );
                            },
                            child: FadeIn(
                              3.5,
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: totalWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
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
