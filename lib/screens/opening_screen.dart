import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
//Facebook login

  // FacebookLogin facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.6,
              width: deviceSize.width,
              child: Image.asset("assets/aax.png", fit: BoxFit.cover),
            ),
            Container(
              height: deviceSize.height * 0.4,
              width: deviceSize.width,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    height: deviceSize.height * 0.28,
                    width: deviceSize.width,
                    //  color: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 28),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: InkWell(
                            onTap: () {
                              // facebookLogin.logIn(
                              //     ['email', ' public_profileq']).then((result) {
                              //   switch (result.status) {
                              //     case FacebookLoginStatus.loggedIn:
                              //       FirebaseAuth.instance
                              //           .signInWithCredential(
                              //               FacebookAuthProvider.getCredential(
                              //                   accessToken:
                              //                       result.accessToken.token))
                              //           .then((signedInUser) {
                              //         print(
                              //             'Signed User is ${signedInUser.user.displayName}');
                              //         Navigator.of(context)
                              //             .pushNamedAndRemoveUntil(
                              //                 '/bottombar_screen',
                              //                 (Route<dynamic> route) => false);
                              //       }).catchError((e) {
                              //         print(e);
                              //       });
                              //       break;
                              //     case FacebookLoginStatus.cancelledByUser:
                              //       //
                              //       break;
                              //     case FacebookLoginStatus.error:
                              //       //
                              //       break;
                              //   }
                              // }).catchError((e) {
                              //   print(e);
                              // });
                            },
                            child: Container(
                              height: deviceSize.height * 0.09,
                              width: deviceSize.width,
                              color: Colors.blue,
                              //Color(0xff1976D2),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 25),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      child: Image.asset(
                                          "assets/icons/facebook.png"),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "JOIN US WITH FACEBOOK",
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                            height: 30,
                            width: double.infinity,
                            child: Center(
                              child: Text("OR",
                                  style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                        SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                              height: deviceSize.height * 0.09,
                              width: deviceSize.width,
                              color: Color(0xffE84436),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/signup_screen');
                                },
                                child: Text(
                                  "JOIN US WITH A COMPLICATED FORM",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
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
                                Navigator.pushNamed(context, '/login_screen');
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
    );
  }
}
