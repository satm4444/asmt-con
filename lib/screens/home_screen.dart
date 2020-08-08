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
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
                //Color(0XFF2C9DE3),
              ),
              onPressed: () {})
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
