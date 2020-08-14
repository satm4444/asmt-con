import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBar extends StatelessWidget {
  final String image;
  final String username;

  NotificationBar({
    this.image,
    this.username,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.05),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  image,
                ),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: username,
                  style: GoogleFonts.roboto(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " commented on a confession you commented before.",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
              ])),
              subtitle: Text(
                "3m ago",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
