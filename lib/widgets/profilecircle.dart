import 'dart:io';

import 'package:confession/provider/authprovider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class ProfileCircle extends StatefulWidget {
  @override
  _ProfileCircleState createState() => _ProfileCircleState();
}

class _ProfileCircleState extends State<ProfileCircle> {
  // void didChangeDependencies() {
  //   Provider.of<AuthProvider>(context, listen: false).getUserInfo();
  //   super.didChangeDependencies();
  // }

  bool isLoading = false;
  bool isVisible = false;
  File image;
  String filename;
  String imgURL;
  final _imagePicker = ImagePicker();

  ///----for choosing the image from the device--//
  Future<void> getImage() async {
    final selectedImage = await _imagePicker.getImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 400,
        imageQuality: 40);

    setState(() {
      image = File(selectedImage.path);
      filename = path.basename(image.path);
    });
    setState(() {
      isVisible = true;
    });

    // print(filename);
  }

//-----for setting and uploading image---///
  Future<void> upAndsetimage() async {
    setState(() {
      isVisible = false;
    });
    setState(() {
      isLoading = true;
    });
    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = ref.putFile(image);
    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    imgURL = downUrl.toString();

    Provider.of<AuthProvider>(context, listen: false).updateUserphoto(imgURL);

    setState(() {
      isLoading = false;
    });
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text("Your Profile picture has been updated"),
            actions: <Widget>[
              FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final uploadedimg =
        Provider.of<AuthProvider>(context, listen: false).imgUrl;
    return Stack(
      children: [
        isLoading
            ? CircularProgressIndicator()
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 130,
                  width: 130,
                  child: image == null
                      ? Image.network(
                          uploadedimg,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
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
              onPressed: () {
                getImage();
              },
              minWidth: 30,
              height: 30,
              child: Icon(
                Icons.camera_enhance,
                size: 18,
                color: Colors.pink,
              ),
            )),
        isVisible
            ? Positioned(
                top: 88,
                left: 5,
                child: MaterialButton(
                  // elevation: 1,
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    image = null;
                    setState(() {
                      isVisible = false;
                    });
                  },
                  minWidth: 30,
                  height: 30,
                  child: Icon(
                    Icons.cancel,
                    size: 18,
                    color: Colors.red,
                  ),
                ))
            : Positioned(top: 91, left: 45, child: SizedBox()),
        isVisible
            ? Positioned(
                top: 91,
                left: 45,
                child: MaterialButton(
                  // elevation: 1,
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    upAndsetimage();
                  },
                  minWidth: 30,
                  height: 30,
                  child: Icon(
                    Icons.check_box,
                    size: 18,
                    color: Colors.green,
                  ),
                ))
            : Positioned(top: 91, left: 45, child: SizedBox()),
      ],
    );
  }
}
