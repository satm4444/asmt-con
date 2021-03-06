import 'package:confession/model/comment.dart';
import 'package:confession/provider/authprovider.dart';
import 'package:confession/provider/confession_provider.dart';

import 'package:confession/widgets/commentbuilder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfessionDetailScreen extends StatefulWidget {
  static const routeName = "/confession_detail_screen";

  @override
  _ConfessionDetailScreenState createState() => _ConfessionDetailScreenState();
}

class _ConfessionDetailScreenState extends State<ConfessionDetailScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    final id = args["id"];
    final autoFocusComment = args["autoFocusComment"];
    final confession =
        Provider.of<ConfessionProvider>(context, listen: false).findById(id);

    final name = Provider.of<AuthProvider>(context, listen: false).userName;
    final userimage = Provider.of<AuthProvider>(context, listen: false).imgUrl;
    final _form = GlobalKey<FormState>();

    var addingCmt = Comment(
      userName: name,
      userProfile: userimage,
      userComment: "",
    );
    //------Get the user Comment-----------------
    void _saveForm() {
      final isValid = _form.currentState.validate();
      if (!isValid) {
        return;
      }
      _form.currentState.save();
      Provider.of<ConfessionProvider>(context, listen: false)
          .addComment(id, addingCmt);
      _form.currentState.reset();
    }

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
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: " CONFESSIONS",
            style: GoogleFonts.sriracha(
              fontSize: 20,
              color: Color(0xffE30045),
            ),
          )
        ])),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
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
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "#" + "male",
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
                  //------------Others Comment-------------------
                  confession.comment == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 200,
                            child: CommentBuilder(id),
                          ),
                        ),
                ],
              ),
            ),
          ),
          //-----------Post your comment----------------
          Container(
            alignment: Alignment.bottomCenter,
            height: 45,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Form(
                          key: _form,
                          child: TextFormField(
                            onSaved: (value) {
                              addingCmt = Comment(
                                userName: addingCmt.userName,
                                userProfile: addingCmt.userProfile,
                                userComment: value,
                              );
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter the comment first !";
                              }

                              return null;
                            },
                            autofocus: autoFocusComment,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "write a comment",
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
                        onPressed: _saveForm)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
