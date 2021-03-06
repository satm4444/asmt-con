import 'package:confession/model/comment.dart';
import 'package:flutter/cupertino.dart';

class Confession with ChangeNotifier {
  final String id;
  final String sem;
  final String faculty;
  final String description;
  final String gender;
  final List<Comment> comment;
  Confession(
      {@required this.id,
      @required this.sem,
      @required this.faculty,
      @required this.description,
      @required this.gender,
      this.comment});
}
