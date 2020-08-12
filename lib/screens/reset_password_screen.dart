import 'package:confession/screens/bottom_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "/reset_password_screen";
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _form = GlobalKey<FormState>();
  String _email;
  void checkLogin() {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      resetPassword();
    }
  }

  Future<void> resetPassword() async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: _email).then((email) {
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
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      height: deviceSizeHeight * 0.3, width: deviceSizeWidth),
                  Container(
                    height: 30,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Reset Your Password",
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
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
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                        hintText: "eg: binod@gmail.com"),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                  "Send Mail",
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
