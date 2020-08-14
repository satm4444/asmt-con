import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentBar extends StatelessWidget {
  final String image;
  final String username;
  final String comment;
  CommentBar({this.image, this.username, this.comment});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
              title: Text(
                username,
                style: GoogleFonts.roboto(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                comment,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
