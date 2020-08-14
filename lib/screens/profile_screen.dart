import 'package:confession/widgets/profilecircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          "My Profile",
          style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Container(
            height: 130,
            width: double.infinity,
            child: Center(
              child: ProfileCircle(),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Satyam Rawal",
            style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "rawalsatyam018@gmail.com",
            style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Buttons(Icons.info, "About Us", Colors.teal, () {}),
                  Buttons(CupertinoIcons.phone_solid, "Contact Us",
                      Colors.green, () {}),
                  Buttons(Icons.star, "Rate Us", Colors.orange, () {}),
                  Buttons(Icons.share, "Share this app", Colors.blue, () {}),
                  Buttons(Icons.backspace, "Logout", Colors.red, () {})
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Function callback;
  Buttons(this.icon, this.label, this.color, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      child: FlatButton.icon(
        onPressed: callback,
        icon: Icon(
          icon,
          color: Colors.white70,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
