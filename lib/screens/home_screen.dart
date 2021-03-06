import 'package:confession/provider/authprovider.dart';
import 'package:confession/widgets/confession.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //--for fetching user data--//
  void didChangeDependencies() {
    Provider.of<AuthProvider>(context, listen: false).getUserInfo();
    super.didChangeDependencies();
  }

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
        onPressed: () {
          Navigator.pushNamed(context, "/add_screen");
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xffE30045),
      ),
    );
  }
}
