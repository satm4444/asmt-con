import 'package:confession/provider/confession_provider.dart';
import 'package:confession/widgets/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentBuilder extends StatelessWidget {
  final String id;
  CommentBuilder(this.id);
  @override
  Widget build(BuildContext context) {
    final confession = Provider.of<ConfessionProvider>(context).findById(id);
    return ListView.builder(
      itemBuilder: (ctx, index) => CommentBar(
        image: confession.comment[index].userProfile,
        username: confession.comment[index].userName,
        comment: confession.comment[index].userComment,
      ),
      itemCount: confession.comment.length,
    );
  }
}
