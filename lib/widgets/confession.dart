import 'package:confession/provider/confession_provider.dart';
import 'package:confession/screens/confession_detail_screen.dart';
import 'package:confession/widgets/confession_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Confession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final confession = Provider.of<ConfessionProvider>(context).confession;
    return ListView.builder(
      itemBuilder: (ctx, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ConfessionDetailScreen.routeName,
              arguments: {
                "id": confession[index].id,
                "autoFocusComment": false
              });
        },
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 10, top: 5, left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              //Color(0xffE30045).withOpacity(0.2),
              //Color(0XFFF0EFF0),
              borderRadius: BorderRadius.circular(15.0)),
          child: ConfessionItem(
            id: confession[index].id,
            description: confession[index].description,
            faculty: confession[index].faculty,
            sem: confession[index].sem,
            comment: confession[index].comment,
          ),
        ),
      ),
      itemCount: confession.length,
    );
  }
}
