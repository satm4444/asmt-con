import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          centerTitle: true,
        ),
        body: Text("Notification Section on Progress"));
  }
}
