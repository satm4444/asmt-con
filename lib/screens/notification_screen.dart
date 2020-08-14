import 'package:confession/widgets/notificationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          title: Text(
            "Notifications",
            style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            NotificationBar(
              image: "assets/user.png",
              username: "Anil",
            ),
            NotificationBar(
              image: "assets/user.png",
              username: "Binod",
            ),
            NotificationBar(
              image: "assets/user.png",
              username: "Nabin",
            ),
            NotificationBar(
              image: "assets/user.png",
              username: "Satyam",
            ),
          ],
        ));
  }
}
