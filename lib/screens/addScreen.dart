import 'package:confession/model/confession.dart';
import 'package:confession/provider/confession_provider.dart';
import 'package:confession/screens/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  static const routeName = "/add_screen";

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _form = GlobalKey<FormState>();
  String sem;
  String faculty;
  String gender;
  String confession;
  void _addConfession() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Confession newConfession = Confession(
        id: "",
        sem: sem,
        faculty: faculty,
        gender: gender,
        description: confession);
    Provider.of<ConfessionProvider>(context, listen: false)
        .addConfession(newConfession);
    Navigator.of(context).pushNamedAndRemoveUntil(
        "/bottombar_screen", (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Add Your",
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
          ),
        ])),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _addConfession,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.chilanka(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Semester",
                      labelStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Should not be empty";
                    }
                    if (double.tryParse(value) == null) {
                      return "Value must be in numeric term";
                    }
                    if (double.parse(value) <= 0) {
                      return "Value should not be less than zero";
                    }
                    return null;
                  },
                  onSaved: (userInput) {
                    sem = userInput;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.chilanka(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Faculty",
                      labelStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  onSaved: (userInput) {
                    faculty = userInput;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.chilanka(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Should not be empty";
                    }

                    return null;
                  },
                  onSaved: (userInput) {
                    gender = userInput;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.chilanka(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  maxLines: 10,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Confess your feelings",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  onSaved: (userInput) {
                    confession = userInput;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
