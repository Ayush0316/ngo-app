import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class profile_user extends StatefulWidget {
  const profile_user({super.key});

  @override
  State<profile_user> createState() => _profile_userState();
}

class _profile_userState extends State<profile_user> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;
  String status = " ";

  File? imageFile;

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 20);

    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload Profile Picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.gallery);
                  },
                  leading: Icon(Icons.photo_album),
                  title: Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.camera);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a photo"),
                ),
              ],
            ),
          );
        });
  }

  bool first = true;
  dynamic user;
  dynamic data;
  dynamic name_data;
  String? name;

  @override
  Widget build(BuildContext context) {
    if (first) {
      user = Provider.of<CustUser?>(context);
      data = Provider.of<Data>(context).data;
      name_data = Provider.of<Data>(context).data["name"];
      name = name_data != null ? name_data : "Name";
      imageFile = data["Imgurl"];
      first = false;
    }

    final myController = TextEditingController();
    myController.text = name!;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _key,
        backgroundColor: Color.fromARGB(249, 255, 255, 255),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(false),
          ),
          backgroundColor: Colors.blue,
          title: const Text("Edit Profile"),
          elevation: 0.0,
        ),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top: 0, left: 0)),
                Expanded(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        (imageFile != null) ? FileImage(imageFile!) : null,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: imageFile == null
                          ? Image.asset("images/logo.png")
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: FormBuilder(
                    child: FormBuilderTextField(
                      controller: myController,
                      name: "user_name",
                      // obscureText: obscure,
                      decoration: InputDecoration(
                        labelText: 'NAME',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    showPhotoOptions();
                  },
                  child: Text(
                    "CHANGE PICTURE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Black',
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                // trying to upload a img.
                String? Imgurl;
                if (imageFile != null) {
                  Imgurl = await DatabaseService(uid: user?.uid)
                      .uploadImage(imageFile);
                }

                data["Imgurl"] = Imgurl;
                print(Imgurl);

                // username changes
                data["name"] = myController.text;
                if (data["type"] == "Ngo") {
                  await DatabaseService(uid: user?.uid).updateNgoData(data);
                } else {
                  await DatabaseService(uid: user?.uid).updateUserData(data);
                }
                await Provider.of<Data>(context, listen: false)
                    .updateAccount(user?.uid);
                setState(() {
                  status = "Profile changed successfully";
                });
              },
              child: const Text(
                "SAVE DETAILS",
                style: TextStyle(
                    letterSpacing: 0.3,
                    fontSize: 17,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0.0,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                status,
                style: TextStyle(color: Colors.green),
              )),
            ),
          ]),
        )),
      ),
    );
  }
}
