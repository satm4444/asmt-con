import 'package:flutter/cupertino.dart';

class Comment with ChangeNotifier {
  final String userName;
  final String userProfile;
  final String userComment;
  Comment({
    @required this.userName,
    @required this.userProfile,
    @required this.userComment,
  });
}
