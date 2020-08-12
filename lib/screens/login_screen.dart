import 'package:confession/screens/bottom_bar_screen.dart';
import 'package:confession/screens/reset_password_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isLoading = false;
  final _form = GlobalKey<FormState>();
  String _email;
  String _password;
  Future<void> checkVerification() async {
    print("Check Verification");
    var user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _isLoading = false;
    });
    if (user.isEmailVerified) {
      print("Logging In");
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/bottombar_screen', (Route<dynamic> route) => false);
    } else if (!user.isEmailVerified) {
      return showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: Text("Verify your Email Address First"),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }
  }

  Future<void> logIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      FirebaseUser user = await _firebaseAuth
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((authResult) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/bottombar_screen', (Route<dynamic> route) => false);
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });
        if (error.code == "ERROR_USER_NOT_FOUND") {
          return showCupertinoDialog(
              context: context,
              builder: (ctx) {
                return CupertinoAlertDialog(
                  title: Text("Invalid Email!!!"),
                  actions: <Widget>[
                    CupertinoDialogAction(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                );
              });
        }
        if (error.code == "ERROR_WRONG_PASSWORD") {
          return showCupertinoDialog(
              context: context,
              builder: (ctx) {
                return CupertinoAlertDialog(
                  title: Text("Invalid Password!!!"),
                  actions: <Widget>[
                    CupertinoDialogAction(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                );
              });
        }
        return null;
      });
      if (user.isEmailVerified) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BottomBarScreen()));
      } else if (!user.isEmailVerified) {
        CupertinoAlertDialog(
          title: Text("Verify your Email Address First"),
          actions: <Widget>[
            CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      }
    } catch (error) {
      throw (error);
    }
  }

  void checkLogin() {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      logIn();
    }
  }

  Future<void> resetPassword() async {
    var emailAddress = "nabindangol2@gmail.com";

    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailAddress)
        .then((email) {
      return showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: Text("Email Send Successfully"),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }).catchError((error) {
      return showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: Text("Unable to send password reset mail"),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSizeHeight = MediaQuery.of(context).size.height;
    var deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: deviceSizeHeight,
        width: deviceSizeWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/back.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: _isLoading
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Logging In...",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )
            : Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: deviceSizeHeight * 0.3,
                            width: deviceSizeWidth),
                        Container(
                          height: 30,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Login with Email",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  letterSpacing: 1,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: deviceSizeHeight * 0.7,
                          width: deviceSizeWidth,
                          // color: Colors.red,
                          child: Column(
                            children: <Widget>[
                              Form(
                                key: _form,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 10),
                                        TextFormField(
                                          validator: (value) {
                                            if (value.trim() == null) {
                                              return 'Field must not be empty';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _email = value;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              fillColor: Colors.white,
                                              labelText: "Email",
                                              labelStyle: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              hintText: "eg: binod@gmail.com"),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          obscureText: true,
                                          validator: (value) {
                                            if (value.trim() == null) {
                                              return 'Field must not be empty';
                                            }
                                            if (value.length < 8) {
                                              return 'Length must not be less then 8';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _password = value;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              fillColor: Colors.white,
                                              labelText: "Password",
                                              labelStyle: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              hintText: "********"),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Container(
                                    height: deviceSizeHeight * 0.09,
                                    width: deviceSizeWidth,
                                    decoration: BoxDecoration(
                                        color: Color(0xffE30045),
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 2,
                                        )),
                                    child: FlatButton(
                                      onPressed: checkLogin,
                                      child: Text(
                                        "LOGIN",
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ResetPasswordScreen.routeName);
                                },
                                child: Text(
                                  "Forget your password?",
                                  style: GoogleFonts.chilanka(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(height: 5),
                              Container(
                                height: deviceSizeHeight * 0.12,
                                width: deviceSizeWidth,
                                //color: Colors.orange,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Don't have an account ?",
                                      style: GoogleFonts.chilanka(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1,
                                            color: Color(0xffE84436)
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "/signup_screen");
                                          },
                                          child: Text(
                                            "SIGNUP",
                                            style: GoogleFonts.ubuntu(
                                                color: Color(0xffE84436),
                                                // fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 30,
                      child: IconButton(
                          icon: Icon(CupertinoIcons.back,
                              size: 30, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })),
                ],
              ),
      ),
    );
  }
}
