import 'package:confession/provider/confession_provider.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("ASMT CONFESSION"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: 10.0, top: 5.0, right: 5.0, bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                confession.sem + " sem , " + confession.faculty,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("#male"),
              SizedBox(
                height: 10,
              ),
              Text(
                confession.description,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Text("Comment Section"),
              Divider(),
              Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    autofocus: autoFocusComment,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Write a comment...",
                        hintStyle: TextStyle(color: Colors.white)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
