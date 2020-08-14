import 'package:confession/model/comment.dart';
import 'package:confession/provider/confession_provider.dart';

import 'package:confession/widgets/commentbuilder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfessionDetailScreen extends StatefulWidget {
  static const routeName = "/confession_detail_screen";

  @override
  _ConfessionDetailScreenState createState() => _ConfessionDetailScreenState();
}

class _ConfessionDetailScreenState extends State<ConfessionDetailScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController cmtcom = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    final id = args["id"];
    final autoFocusComment = args["autoFocusComment"];
    // print(id);
    final confession =
        Provider.of<ConfessionProvider>(context, listen: false).findById(id);

    var cmt = Comment(
      userName: "Sao",
      userProfile:
          "https://www.johsblog.com/wp-content/uploads/2020/05/Dr-stone-151.jpg",
      userComment: cmtcom.text,
    );
    print(cmtcom.text);

    void addComments() {
      Provider.of<ConfessionProvider>(context, listen: false)
          .addComment(id, cmt);
    }

    // void _saveForm() {
    //   print("Save Form Here");
    //   final isValid = _form.currentState.validate();
    //   if (!isValid) {
    //     return;
    //   }
    //   _form.currentState.save();
    //   Provider.of<ConfessionProvider>(context, listen: false)
    //       .addComment(id, cmt);
    // }

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
            confession.comment == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 200,
                      child: CommentBuilder(id),
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
                          child: Form(
                            key: _form,
                            child: TextFormField(
                              controller: cmtcom,
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
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Color(0xffE30045),
                          ),
                          onPressed: () {
                            addComments();
                          })
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
