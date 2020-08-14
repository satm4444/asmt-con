import 'package:flutter/material.dart';

class ProfileCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 130,
            width: 130,
            child: Image.asset(
              "assets/user.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 85,
            left: 85,
            child: MaterialButton(
              // elevation: 1,
              padding: EdgeInsets.zero,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
              minWidth: 30,
              height: 30,
              child: Icon(
                Icons.camera_enhance,
                size: 18,
                color: Colors.pink,
              ),
            ))
      ],
    );
  }
}
