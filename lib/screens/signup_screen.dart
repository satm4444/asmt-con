import 'package:confession/provider/authprovider.dart';
import 'package:confession/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/Signup_screen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  final passwordController = TextEditingController();
  String _email;
  String _password;
  String _name;

  Future<void> verification() async {
    var user = await FirebaseAuth.instance.currentUser();
    user.sendEmailVerification().then((push) {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }).catchError((error) {
      return showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: Text("An Error Occurred while sending email verification"),
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

  Future<void> signUp() async {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .then((authResult) {
          verification();
        }).catchError((error) {
          setState(() {
            _isLoading = false;
          });
          if (error.code == "ERROR_EMAIL_ALREADY_IN_USE") {
            return showCupertinoDialog(
                context: context,
                builder: (ctx) {
                  return CupertinoAlertDialog(
                    title: Text("Email already exists!!"),
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
        Provider.of<AuthProvider>(context, listen: false).updateUserInfo(_name);
      } catch (error) {
        throw (error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
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
                      "Signing Up...",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )
            : Stack(
                children: <Widget>[
                  Container(
                    height: deviceSize.height,
                    width: deviceSize.width,
                    color: Colors.white.withOpacity(0),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: deviceSize.height * 0.3,
                            width: deviceSize.width),
                        Container(
                          height: 30,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "SignUp with Email",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  letterSpacing: 1,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: deviceSize.height * 0.7,
                          width: deviceSize.width,
                          // color: Colors.red,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Form(
                                  key: _form,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 10),
                                        TextFormField(
                                          validator: (value) {
                                            if (value.trim() == "") {
                                              return 'Field should not be empty';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _name = value;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              fillColor: Colors.white,
                                              labelText: "Name",
                                              labelStyle: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              hintText: "eg: Asmt"),
                                          // keyboardType: TextInputType.emailAddress,
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          onSaved: (value) {
                                            _email = value;
                                          },
                                          validator: (value) {
                                            if (value.trim() == "") {
                                              return 'Field should not be empty';
                                            }
                                            return null;
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
                                          controller: passwordController,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: true,
                                          onSaved: (value) {
                                            _password = value;
                                          },
                                          validator: (value) {
                                            if (value.trim() == "") {
                                              return 'Field should not be empty';
                                            }
                                            return null;
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
                                              hintText: "eg: ********"),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: true,
                                          validator: (value) {
                                            if (value !=
                                                passwordController.text) {
                                              return 'Password does not match';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            fillColor: Colors.white,
                                            labelText: "Confirm Password",
                                            labelStyle: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Container(
                                      height: deviceSize.height * 0.09,
                                      width: deviceSize.width,
                                      decoration: BoxDecoration(
                                          color: Color(0xffE30045),
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          )),
                                      child: FlatButton(
                                        onPressed: signUp,
                                        child: Text(
                                          "GET STARTED",
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                // SizedBox(height: 5),
                                Container(
                                  height: deviceSize.height * 0.12,
                                  width: deviceSize.width,
                                  //color: Colors.orange,
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Already have an account ?",
                                        style: GoogleFonts.chilanka(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                          height: 30,
                                          width: 80,
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
                                                  context, '/login_screen');
                                            },
                                            child: Text(
                                              "LOGIN",
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
                            Navigator.pushReplacementNamed(
                                context, '/opening_screen');
                          })),
                ],
              ),
      ),
    );
  }
}
