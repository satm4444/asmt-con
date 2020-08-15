import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  String email;
  String userName;
  String imageUrl;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> updateUserInfo(String name) async {
    var user = await _firebaseAuth.currentUser();
    UserUpdateInfo info = new UserUpdateInfo();
    info.displayName = name;
    info.photoUrl =
        "https://www.johsblog.com/wp-content/uploads/2020/05/Dr-stone-151.jpg";
    user.updateProfile(info);
    await user.reload();
  }

  Future<void> updateUserphoto(String imageUrl) async {
    var user = await _firebaseAuth.currentUser();
    UserUpdateInfo info = new UserUpdateInfo();

    info.photoUrl = imageUrl;
    user.updateProfile(info);
    await user.reload();
  }

  Future<void> getUserInfo() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    email = user.email;
    userName = user.displayName;
    imageUrl = user.photoUrl;
  }

  String get usname {
    return userName;
  }

  String get usemail {
    return email;
  }

  String get imgUrl {
    return imageUrl;
  }
}
