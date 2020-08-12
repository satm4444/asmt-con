import 'package:confession/widgets/confession.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF0EFF0),
      appBar: AppBar(
        backgroundColor: Color(0XFFF0EFF0),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
        elevation: 0,
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "ASMT",
            style: GoogleFonts.sriracha(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: " CONFESSIONS",
            style: GoogleFonts.sriracha(
              fontSize: 25,
              color: Color(0xffE30045),
            ),
          )
        ])),
        centerTitle: false,
      ),
      body: Confession(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xffE30045),
      ),
    );
  }
}
