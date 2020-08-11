import 'package:confession/model/comment.dart';
import 'package:confession/screens/confession_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ConfessionItem extends StatelessWidget {
  final String id;
  final String sem;
  final String faculty;
  final String description;
  final List<Comment> comment;
  ConfessionItem(
      {@required this.id,
      @required this.sem,
      @required this.faculty,
      @required this.description,
      this.comment});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          sem + " Sem, " + faculty,
          style: GoogleFonts.balooBhai(
            fontSize: 22,
            //fontWeight: FontWeight.bold
          ),
        ),
        Text(
          "#male",
          style: GoogleFonts.balooBhai(
            fontSize: 22,
            //fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ReadMoreText(
          description,
          style: GoogleFonts.chilanka(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          trimLines: 14,
          colorClickableText: Color(0xffE30045),
          trimMode: TrimMode.Line,
          trimExpandedText: "...see less",
          trimCollapsedText: "...see more",
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ConfessionDetailScreen.routeName,
                arguments: {"id": id, "autoFocusComment": true});
          },
          child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.02),
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Text(
                "Write a comment...",
                style: TextStyle(color: Colors.grey),
              )),
        )
      ],
    );
  }
}
