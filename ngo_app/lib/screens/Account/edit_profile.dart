import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustUser?>(context);
    final data = Provider.of<Data>(context).data;
    final name_data = Provider.of<Data>(context).data["name"];
    String name = name_data != null ? name_data : "Name";

    final myController = TextEditingController();
    myController.text = name;

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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("images/logo.png"),
                      )),
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
                  onPressed: () {},
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
                print(myController.text);
                print(data);
                print(user!.uid);
                data["user_name"] = myController.text;
                await DatabaseService(uid: user.uid).updateUserData(data);
                await Provider.of<Data>(context, listen: false)
                    .updateAccount(user.uid);
                setState(() {
                  status = "Username changed successfully";
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
