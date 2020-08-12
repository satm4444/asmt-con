import 'package:confession/provider/confession_provider.dart';
import 'package:confession/widgets/comment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfessionDetailScreen extends StatelessWidget {
  static const routeName = "/confession_detail_screen";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    final id = args["id"];
    final autoFocusComment = args["autoFocusComment"];
    // print(id);
    final confession =
        Provider.of<ConfessionProvider>(context, listen: false).findById(id);
    return Scaffold(
      backgroundColor: Color(0XFFF0EFF0),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.share, color: Colors.grey), onPressed: () {})
        ],
        elevation: 0,
        backgroundColor: Color(0XFFF0EFF0),
        centerTitle: true,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    confession.sem + " sem , " + confession.faculty,
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
                  Text(
                    confession.description,
                    style: GoogleFonts.chilanka(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 200,
                child: ListView(
                  children: [
                    CommentBar(
                      image: "assets/aax.png",
                      username: "Anil Amatya",
                      comment:
                          "Very heart touching confessions, I am literally crying right now.",
                    ),
                    CommentBar(
                      image: "assets/icons/facebook.png",
                      username: "Facebook Singh",
                      comment: "I am Single and I enjoy reading confessions.",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.02),
                      border: Border.all(
                        width: 1,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            autofocus: autoFocusComment,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Write a comment...",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Color(0xffE30045),
                          ),
                          onPressed: () {})
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
