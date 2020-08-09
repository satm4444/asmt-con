import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Image.asset(
              "assets/back.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            color: Colors.white.withOpacity(0),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    height: deviceSize.height * 0.3, width: deviceSize.width),
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
                  child: Column(
                    children: <Widget>[
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    fillColor: Colors.white,
                                    labelText: "enter your Name",
                                    labelStyle: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    hintText: "eg: Asmt"),
                                // keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    fillColor: Colors.white,
                                    labelText: "enter your Email",
                                    labelStyle: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    hintText: "eg: abc@gmail.com"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    fillColor: Colors.white,
                                    labelText: "enter your Password",
                                    labelStyle: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    hintText: "eg: ahsvjhcavs"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  fillColor: Colors.white,
                                  labelText: "confirm Password",
                                  labelStyle: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup_screen');
                              },
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
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE84436).withOpacity(0.7),
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
              ],
            ),
          ),
          Positioned(
              left: 10,
              top: 30,
              child: IconButton(
                  icon:
                      Icon(CupertinoIcons.back, size: 30, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/opening_screen');
                  })),
        ],
      ),
    );
  }
}
